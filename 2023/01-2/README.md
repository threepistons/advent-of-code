This differs from 01-1 by having a new and nastier regex to deal with.

The spelled out digits need to be mapped to integer digits too.

The fun part was realising that I needed to also write the nastier regex and the name->digit map backwards.

Reversing the string to cope with my inability to figure out how to search for the last item in the string had unexpected benefits because I didn't get bitten by the "oneight" overlap problem that caught many other people out. [1], [2], [3]

[1]: https://www.reddit.com/r/adventofcode/comments/188g7ye/2023_day_1_part_2_requirements_ambiguity/
[2]: https://www.reddit.com/r/adventofcode/comments/188lweu/2023_day_1_part_2_another_tip_for_anyone_still/
[3]: https://www.reddit.com/r/adventofcode/comments/1884fpl/2023_day_1for_those_who_stuck_on_part_2/
