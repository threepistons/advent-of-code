#!/usr/bin/python3

import re
import string
import argparse
parser = argparse.ArgumentParser()
parser.add_argument("--run", action="store_true")
args = parser.parse_args()

def test_answer():
    assert cubecounter('test.txt') == 8

def cubecounter(document):
    colours = {'red': 12, 'green': 13, 'blue': 14}
    sum = 0
    with open(document) as d:
        # make a list of all the lines
        text = d.readlines()
    for line in text:
        a = re.compile(r"\d+")
        # the first integers in each line are the game id
        b = a.search(line)
        gameid = int(b.group(0))
        # print(gameid)
        # Now the harder bit
        # get the line after the colon
        game = line.partition(':')[2]
        # print(game)
        # and make another dict
        c = re.compile(r"[;,]")
        e = re.split(c, game)
        # print(e)
        # e is a list of strings like " 23 red"
        greenflag = True
        for f in e:
            draw = f.strip().partition(" ")
            # draw is a tuple like ('23', ' ', 'red')
            for colour, ceiling in colours.items():
                if colour == draw[2] and int(ceiling) < int(draw[0]):
                    greenflag = False
        if greenflag == True:
            sum += gameid
    return(sum)

if args.run:
    result = cubecounter('input.txt')
    print(result)
