#!/usr/bin/python3

import re
import string

def test_answer():
    assert cubecounter('../02-1/test.txt') == 2286

def cubecounter(document):
    pows = 0
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
        # each string represents a draw and each list of strings is a game
        reds = list()
        greens = list()
        blues = list()
        for f in e:
            draw = f.strip().partition(" ")
            # draw is a tuple like ('23', ' ', 'red')
            match draw[2]:
                case 'red':
                    reds.append(int(draw[0]))
                case 'green':
                    greens.append(int(draw[0]))
                case 'blue':
                    blues.append(int(draw[0]))
        pows += max(reds) * max(greens) * max(blues)
    return(pows)

result = cubecounter('../02-1/input.txt')

print(result)
