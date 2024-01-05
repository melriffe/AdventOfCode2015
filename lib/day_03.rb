# frozen_string_literal: true

##
# --- Day 3: Perfectly Spherical Houses in a Vacuum ---
# https://adventofcode.com/2015/day/3
#
class Day03
  attr_accessor :data

  def self.robo_calculate data
    new(data, [GiftDeliverer.new, GiftDeliverer.new]).calculate
  end

  def self.calculate data
    new(data, [GiftDeliverer.new]).calculate
  end

  def initialize data, workers
    self.data = data
    self.workers = workers
  end

  def santa
    workers.first
  end

  def robo_santa
    workers.last
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
    workers.map(&:start)
    skip_skipping = workers.one?

    data.chars.each_with_index do |char, index|
      worker = if skip_skipping
                 santa
               else
                 index.even? ? santa : robo_santa
               end

      case char
      when '^'
        worker.north
      when 'v'
        worker.south
      when '>'
        worker.east
      when '<'
        worker.west
      end
    end
    self
  end

  def houses_visited
    locations = []
    workers.collect { |worker| locations += worker.locations }
    locations.uniq.size
  end

  private

  attr_accessor :workers
end

##
# Represent Someone that delivers gifts to houses.
class GiftDeliverer
  def initialize
    self.houses = Hash.new { |h, k| h[k] = 0 }
    self.x = self.y = 0
  end

  def start
    houses[current_location] += 1
  end

  def locations
    houses.keys
  end

  def houses_visited
    houses.keys.size
  end

  def north
    self.y += 1
    leave_present
  end

  def south
    self.y -= 1
    leave_present
  end

  def east
    self.x += 1
    leave_present
  end

  def west
    self.x -= 1
    leave_present
  end

  def current_location
    "#{x}#{y}"
  end

  private

  attr_accessor :houses, :x, :y

  def leave_present
    houses[current_location] += 1
  end
end
