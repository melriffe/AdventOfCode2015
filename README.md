# Advent Of Code 2015

Another foray into the [Advent Of Code](https://adventofcode.com/2015) exercises

## Language of Solutions

My solutions will be done in [Ruby](https://www.ruby-lang.org/en/). I will be using [RSpec](https://relishapp.com/rspec/) to verify my solutions.

I will organize by Days, as they are presented on the AoC website.

## Days

* [Day 1: Not Quite Lisp](https://adventofcode.com/2015/day/1) ⭐️ ⭐️
* [Day 2: I Was Told There Would Be No Math](https://adventofcode.com/2015/day/2) ⭐️ ⭐️
* [Day 3: Perfectly Spherical Houses in a Vacuum](https://adventofcode.com/2015/day/3) ⭐️ ⭐️
* [Day 4: The Ideal Stocking Stuffer](https://adventofcode.com/2015/day/4) ⭐️ ⭐️
* [Day 5: Doesn't He Have Intern-Elves For This?](https://adventofcode.com/2015/day/5) ⭐️ ⭐️
* [Day 6: Probably a Fire Hazard](https://adventofcode.com/2015/day/6)
* Day 7: Some Assembly Required
* Day 8: Matchsticks
* Day 9: All in a Single Night
* Day 10: Elves Look, Elves Say
* Day 11: Corporate Policy
* Day 12: JSAbacusFramework.io
* Day 13: Knights of the Dinner Table
* Day 14: Reindeer Olympics
* Day 15: Science for Hungry People
* Day 16: Aunt Sue
* Day 17: No Such Thing as Too Much
* Day 18: Like a GIF For Your Yard
* Day 19: Medicine for Rudolph
* Day 20: Infinite Elves and Infinite Houses
* Day 21: RPG Simulator 20XX
* Day 22: Wizard Simulator 20XX
* Day 23: Opening the Turing Lock
* Day 24: It Hangs in the Balance
* Day 25: Let It Snow

## Setup

I created this project/repository manually. I modeled it after my 2020 project. I don't remember how I created the structure of it, so I just mimicked the files and directories.

To check the solutions just run:

```
$ rake
```

### Structure

I used my AOC 2020 Implementation as inspiration. I have `Day` classes but I elected to use them in a more OO manner, where I query the 'model' for the answers requested by AOC. I've elected to have a `calculate` class method that is the primary interface to the Day's challenges. Where appropriate I've implemented Helper classes; they're tested separately.

The Test Specs will have an Examples context and a Exercises context.

The Fixtures directory will contain the input data for each exercise.

