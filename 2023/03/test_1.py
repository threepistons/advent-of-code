#!/bin/python3

import string
import re
import argparse
parser = argparse.ArgumentParser()
parser.add_argument("--run", action="store_true")
args = parser.parse_args()

def test_answer():
    assert partnumber('test.txt') == 4361

def partnumber(doc):
    with open(doc) as d:
        # make a list of all the lines
        text = d.readlines()
    # I have a list of lines called "text"
    nummap = list()
    symmap = list()
    resultsmap = list()
    digits = re.compile(r'\d+')
    lineno = 0
    for line in text:
        # list is a string
        # chars = str.split(line, '')
        # str.split no worky
        charno = 0
        # remove the line feeds as Python interprets them as an extra character
        while charno < (len(str.strip(line,'\n'))):
            match line[charno]:
                case '.':
                    charno += 1
                case '0' | '1' | '2' | '3' |'4' | '5' | '6' | '7' | '8' | '9':
                    string = digits.search(line, charno)
                    nummap.append(list((lineno, charno, string[0])))
                    charno += len(string[0])
                case _:
                    symmap.append(list((lineno, charno)))
                    charno += 1
        lineno += 1
    # I have a structured representation of the locations of integers and symbols. Phew.
    for numpoint in nummap: # numpoint is ONE [row, col, 'value']
        for row in range(numpoint[0]-1, numpoint[0]+2):
            for col in range(numpoint[1]-1, numpoint[1]+len(numpoint[2])+1):
                if list((row, col)) in symmap and numpoint not in resultsmap:
                    resultsmap.append(numpoint)
    endresult = 0
    for result in resultsmap:
        endresult += int(result[2])
    return(endresult)    

if args.run:
    print(partnumber('input.txt'))
