# frozen_string_literal: true

##
# --- Day 5: Doesn't He Have Intern-Elves For This? ---
# https://adventofcode.com/2015/day/5
#
class Day05
  attr_accessor :data, :nice_count

  def self.calculate data, logic = :standard
    new(data, logic).calculate
  end

  def initialize data, logic = :standard
    self.data = data
    self.nice_count = 0
    self.logic = logic
    self.classes = {
      standard: StandardLogic,
      advanced: AdvancedLogic
    }
  end

  def calculate
    data.each do |datum|
      self.nice_count += 1 if logic_class.new(datum).nice?
    end
    self
  end

  private

  attr_accessor :logic, :classes

  def logic_class
    @logic_class ||= classes[logic]
  end
end

##
# Worker class to encapsulte 'bad string' logic
class StandardLogic
  def initialize string
    self.string = string
    self.vowels = []
    self.doubled_letters = self.bad_combinations = false
    analyze_string
  end

  ##
  # A nice string is one with all of the following properties:
  #   - It contains at least three vowels (aeiou only), like aei, xazegov, or
  #     aeiouaeiouaeiou.
  #   - It contains at least one letter that appears twice in a row, like xx,
  #     abcdde (dd), or aabbccdd (aa, bb, cc, or dd).
  #   - It does not contain the strings ab, cd, pq, or xy, even if they are
  #     part of one of the other requirements.
  #
  def nice?
    enough_vowels? && doubled_letters? && no_bad_combinations?
  end

  private

  attr_accessor :string, :vowels, :doubled_letters, :bad_combinations

  def analyze_string
    check_for_bad_combinations
    capture_vowel string[0]
    string.chars.each_with_index do |char, index|
      next if index.zero?

      capture_vowel char
      check_for_doubles string[index - 1], char
    end
  end

  def check_for_bad_combinations
    self.bad_combinations = string.match?(/(ab|cd|pq|xy)/)
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

##
# Encapsulates 'new' rules
class AdvancedLogic
  def initialize string
    self.string = string
    self.pairs_found = self.triplet_repeat = false
    analyze_string
  end

  ##
  # Now, a nice string is one with all of the following properties:
  #   - It contains a pair of any two letters that appears at least twice in
  #     the string without overlapping, like xyxy (xy) or aabcdefgaa (aa), but
  #     not like aaa (aa, but it overlaps).
  #   - It contains at least one letter which repeats with exactly one letter
  #     between them, like xyx, abcdefeghi (efe), or even aaa.
  #
  def nice?
    pairs_found? && triplet_repeat?
  end

  private

  attr_accessor :string, :pairs_found, :triplet_repeat, :analysis_key

  def analyze_string
    string.chars.each_with_index do |char, index|
      next if index.zero?

      self.analysis_key = "#{string[index - 1]}#{char}"

      check_for_pairs
      check_for_triplet_repeat index
    end
  end

  def check_for_pairs
    self.pairs_found = string.scan(analysis_key).size >= 2 unless pairs_found
  end

  def check_for_triplet_repeat index
    self.triplet_repeat = analysis_key[0] == string[index + 1] unless triplet_repeat? && index + 1 <= string.length
  end

  def pairs_found?
    pairs_found
  end

  def triplet_repeat?
    triplet_repeat
  end
end
