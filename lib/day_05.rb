# frozen_string_literal: true

##
# --- Day 5: Doesn't He Have Intern-Elves For This? ---
# https://adventofcode.com/2015/day/5
#
class Day05
  attr_accessor :data, :nice_count

  def self.calculate data
    new(data).calculate
  end

  def initialize data
    self.data = data
    self.nice_count = 0
  end

  def calculate
    data.each do |datum|
      self.nice_count += 1 if Child.new(datum).nice?
    end
    self
  end
end

##
# Worker class to encapsulte 'bad string' logic
class Child
  def initialize name
    self.name = name
    self.vowels = []
    self.doubled_letters = self.bad_combinations = false
    analyze_name
  end

  def nice?
    enough_vowels? && doubled_letters? && no_bad_combinations?
  end

  private

  attr_accessor :name, :vowels, :doubled_letters, :bad_combinations

  def analyze_name
    check_for_bad_combinations
    capture_vowel name[0]
    name.chars.each_with_index do |char, index|
      next if index.zero?

      capture_vowel char
      check_for_doubles name[index - 1], char
    end
  end

  def check_for_bad_combinations
    self.bad_combinations = name.match?(/(ab|cd|pq|xy)/)
  end

  def capture_vowel letter
    vowels << letter if letter.match?(/[aeiou]/)
  end

  def check_for_doubles prev_char, char
    self.doubled_letters = prev_char == char unless doubled_letters?
  end

  def enough_vowels?
    vowels.size >= 3
  end

  def doubled_letters?
    doubled_letters
  end

  def no_bad_combinations?
    !bad_combinations
  end
end
