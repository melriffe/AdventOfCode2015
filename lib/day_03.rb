# frozen_string_literal: true

##
# --- Day 3: Perfectly Spherical Houses in a Vacuum ---
# https://adventofcode.com/2015/day/3
#
class Day03
  attr_accessor :data

  def self.calculate data
    new(data).calculate
  end

  def initialize data
    self.data = data
    self.houses = Hash.new { |h, k| h[k] = 0 }
    self.x = self.y = 0
  end

  ##
  # He begins by delivering a present to the house at his starting location,
  # and then an elf at the North Pole calls him via radio and tells him where
  # to move next.
  #
  # Moves are always exactly one house to the north (^), south (v), east (>),
  # or west (<). After each move, he delivers another present to the house at
  # his new location.
  #
  def calculate
    houses[current_location] += 1

    data.chars.each do |char|
      case char
      when '^'
        self.y += 1
      when 'v'
        self.y -= 1
      when '>'
        self.x += 1
      when '<'
        self.x -= 1
      end
      houses[current_location] += 1
    end
    self
  end

  def houses_visited
    houses.keys.size
  end

  private

  attr_accessor :houses, :x, :y

  def current_location
    "#{x}#{y}"
  end
end
