#!/bin/python3

import string
import re
import argparse
parser = argparse.ArgumentParser()
parser.add_argument("--run", action="store_true")
args = parser.parse_args()

def test_answer():
    assert partnumber('test.txt') == 467835

def partnumber(doc):
    with open(doc) as d:
        # make a list of all the lines
        text = d.readlines()
    # I have a list of lines called "text"
    nummap = list()
    astmap = list()
    digits = re.compile(r'\d+')
    lineno = 0
    astid = 0
    numid = 0
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
                    nummap.append(list((lineno, charno, string[0], numid)))
                    charno += len(string[0])
                    numid += 1
                case '*':
                    astmap.append(list((lineno, charno, astid)))
                    charno += 1
                    astid += 1
                case _:
                    charno += 1
        lineno += 1
    #print('NUMMAP')
    #print(nummap)
    #print('ASTMAP')
    #print(astmap)
    # I have a structured representation of the locations of integers and symbols. Phew.
    minesweeper = dict() # you've got the asterisk and all its minesweeper neighbours, and each asterisk has an identifier to be able to match the minesweeper neighbours to the asterisk
    for ast in astmap: # ast is ONE (row, col, id)
        # Find "minesweeper neighbours of each asterisk.
        for row in range(ast[0]-1, ast[0]+2):
            for col in range(ast[1]-1, ast[1]+2):
                # #print(row, col)
                minesweeper[(row, col)] = ast[2]
                #if list((row, col)) in gearmap and numpoint not in resultsmap:
                #    resultsmap.append(numpoint)
    #print('MINESWEEPER')
    #print(minesweeper)
    potentialgears = dict()
    for numpoint in nummap: # numpoint is ONE (row, col, 'value', numid)
        for row in range(numpoint[0], numpoint[0] + 1):
            for col in range(numpoint[1], numpoint[1]+len(numpoint[2])):
                for square in minesweeper: # square is ONE (row, col): astid
                    if square == tuple((row, col)) and minesweeper[square] not in potentialgears:
                        potentialgears[minesweeper[square]] = dict()
                    if square == tuple((row, col)) and numpoint[3] not in potentialgears[minesweeper[square]]:
                        potentialgears[minesweeper[square]][numpoint[3]] = numpoint[2]
                        ##print('lkj', potentialgears[square[2]])
    #print('potentialgears')
    #print(potentialgears)
    endresult = 0
    for potentialgear in potentialgears:
        if len(potentialgears[potentialgear]) == 2:
            gears = potentialgears[potentialgear]
            #print(gears)
            ratio = 1
            for gear in gears:
                ratio = int(gears[gear]) * ratio
                #print(ratio)
            endresult += ratio

    return(endresult)

if args.run:
    print(partnumber('input.txt'))
