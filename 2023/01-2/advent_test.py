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
        digit = re.compile(r"\d|one|two|three|four|five|six|seven|eight|nine")
        # Reverse the search terms to search the reversed string
        rdigit = re.compile(r"\d|eno|owt|eerht|ruof|evif|xis|neves|thgie|enin")
        # find the first digit in line and *10, see https://docs.python.org/3/library/re.html#re.search
        fakefirst = digit.search(line)
        first = enumerator(fakefirst.group(0))
        # Using the objectiness of to squash the previous two lines into one less readable line
        last = enumerator(rdigit.search(rline).group(0))

        calibration += (int(first) * 10) + int(last)

    return(calibration)

def enumerator(thing):
    match thing:
        # zero was not in the spec so I don't include it
        # the matchable cases are not separated by commas as you would expect in Puppet
        case 'one' | 'eno':
            return 1
        case 'two' | 'owt':
            return 2
        case 'three' | 'eerht':
            return 3
        case 'four' | 'ruof':
            return 4
        case 'five' | 'evif':
            return 5
        case 'six' | 'xis':
            return 6
        case 'seven' | 'neves':
            return 7
        case 'eight' | 'thgie':
            return 8
        case 'nine' | 'enin':
            return 9
        # This is how you write "default" in Python. Also this is going to be a digit
        case _:
            return(thing)
    
        

def test_answer():
    assert calibrationcleaner('test.txt') == 542

result = calibrationcleaner('../01-1/input.txt')
print(result)
