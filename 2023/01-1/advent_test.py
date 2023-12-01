#!/usr/bin/python3

import re
import string

def calibrationcleaner(document):
    with open(document) as d:
        # make a list of all the lines
        text = d.readlines()
    calibration = 0
    for line in text:
        # this reverses line
        rline = line [::-1]
        digit = re.compile(r"\d")
        # find the first digit in line and *10, see https://docs.python.org/3/library/re.html#re.search
        first = digit.search(line)
        last = digit.search(rline)
        calibration += (int(first.group(0)) * 10) + int(last.group(0))

    return(calibration)

def test_answer():
    assert calibrationcleaner('test.txt') == 142

result = calibrationcleaner('input.txt')
print(result)
