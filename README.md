# AdventOfCode2015

Another foray into the [Advent Of Code](https://adventofcode.com/2015) exercises

----

## Advent Of Code


## Language of Solutions

My solutions will be done in [Ruby](https://www.ruby-lang.org/en/). I will be using [RSpec](https://relishapp.com/rspec/) to verify my solutions.

I will organize by Days, as they are presented on the AoC website.

## Days

* [Day 1: Not Quite Lisp](https://adventofcode.com/2015/day/1)


## Setup

I created this project/repository manually. I modeled it after my 2020 project. I don't remember how I created the structure of it, so I just mimicked the files and directories.

To check the solutions just run:

```
$ rake
```

### Structure

I will be using the structure I used in my 2020 AOC project where I will have a `Day` class that will implement `#exercise1` (which is the test, when it passes, that will unlock the next exercise) and `#exercise2`.

The Test Specs will have an Examples context and a Exercises context.

The Fixtures directory will contain the input data for each exercise.

