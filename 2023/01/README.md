# Solution ideas

## Mechanism

10. Load the file.
15. Bust the file into lines.
20. For each line, search from the start for the first digit. Multiply by 10 and store.
30. Then search that same line from the end for the last digit. Store what you find.
40. Sum the two results from steps three and four.
50. Sum the results from all the lines.

## Interface

file path in, integer out.

## Unit testing

I'm going to attempt with [PyTest](https://docs.pytest.org/en/7.4.x/) because its `assert` statement forces me to write my Python as functions with the output as return values.

## Assumptions

This is a puzzle, so unlike real life, I can assume that the input file is as described.

## References

- 10: https://docs.python.org/3/tutorial/inputoutput.html#methods-of-file-objects
- 15, 20: https://docs.python.org/3/library/re.html#regular-expression-syntax `\d` is a digit
- 30: https://www.w3schools.com/python/python_howto_reverse_string.asp
```Python
$ python3
Python 3.11.2 (main, Mar 13 2023, 12:18:29) [GCC 12.2.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> line = "I love Lucky"
>>> print (line)
I love Lucky
>>> rline = line[::-1]
>>> print (rline)
ykcuL evol I
```

# Part Two

This differs from 01-1 by having a new and nastier regex to deal with.

The spelled out digits need to be mapped to integer digits too.

The fun part was realising that I needed to also write the nastier regex and the name->digit map backwards.

Reversing the string to cope with my inability to figure out how to search for the last item in the string had unexpected benefits because I didn't get bitten by the "oneight" overlap problem that caught many other people out. [1], [2], [3]

[1]: https://www.reddit.com/r/adventofcode/comments/188g7ye/2023_day_1_part_2_requirements_ambiguity/
[2]: https://www.reddit.com/r/adventofcode/comments/188lweu/2023_day_1_part_2_another_tip_for_anyone_still/
[3]: https://www.reddit.com/r/adventofcode/comments/1884fpl/2023_day_1for_those_who_stuck_on_part_2/
