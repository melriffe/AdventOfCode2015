# frozen_string_literal: true

##
# --- Day 1: Not Quite List ---
# https://adventofcode.com/2015/day/1
#
class Day01
  attr_accessor :data, :floor, :position

  def self.calculate data
    new(data).calculate
  end

  def initialize data
    self.data = data
    self.floor = self.position = 0
  end

  ##
  # An opening parenthesis, (, means he should go up one floor, and a closing
  # parenthesis, ), means he should go down one floor.
  #
  # The apartment building is very tall, and the basement is very deep; he will
  # never find the top or bottom floors.
  #
  # To what floor do the instructions take Santa?
  #
  def calculate
    data.chars.each.with_index(1) do |char, index|
      case char
      when '('
        self.floor += 1
      when ')'
        self.floor -= 1
        self.position = index if position.zero? && floor.negative?
      end
    end
    self
  end
end
