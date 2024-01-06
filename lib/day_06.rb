# frozen_string_literal: true

##
# --- Day 6: Probably a Fire Hazard ---
# https://adventofcode.com/2015/day/6
#
class Day06
  attr_accessor :data

  def self.calculate data
    new(data).calculate
  end

  ##
  # NOTE: `data` ia assumed to be an array of 'instructions'
  #
  # An instruction is: OPERAND Coordinate 'through' Coordinate.
  # Example:
  #   turn on 0,0 through 999,999
  def initialize data
    self.data = data
    self.grid = GridOfLights.new
  end

  ##
  # NOTE: The assumption is that we're dealing with a 1,000 x 1,000 Grid of
  # Lights. We will receive 'instructions' that will tell us which lights to
  # turn on, turn off, or toggle.
  #
  # Lights in your grid are numbered from 0 to 999 in each direction; the
  # lights at each corner are at 0,0, 0,999, 999,999, and 999,0. The
  # instructions include whether to turn on, turn off, or toggle various
  # inclusive ranges given as coordinate pairs. Each coordinate pair represents
  # opposite corners of a rectangle, inclusive; a coordinate pair like 0,0
  # through 2,2 therefore refers to 9 lights in a 3x3 square.
  #
  # The lights all start turned off.
  #
  def calculate
    data.each do |datum|
      parts = datum.split

      coordinates2 = parts[-1]
      coordinates1 = parts[-3]

      case datum
      when /^turn on/
        command = :on
      when /^turn off/
        command = :off
      when /^toggle/
        command = :toggle
      else
        raise 'Ka-Blam!'
      end

      grid.process command, coordinates1, coordinates2
    end

    self
  end

  def lights_on
    grid.lights_on
  end

  def brightness
    grid.brightness
  end

  private

  attr_accessor :grid
end

##
# Represents the grid of lights.
#
class GridOfLights
  def initialize
    self.light_harness = {}
  end

  ##
  # NOTE: The incoming `command` will be one of:
  #   - :on
  #   - :off
  #   - :toggle
  #
  # The incoming `coordinates` represent extents of a rectangle, inclusive. The
  # format of the "coordinate" is: y,x.
  #
  def process command, coordinates1, coordinates2
    rect = Rectangle.for coordinates1, coordinates2
    rect.coordinates.each do |location|
      light_harness[location] = Light.new unless light_harness.key? location
      light_harness[location].send command
      light_harness.delete(location) unless light_harness[location].lit? || light_harness[location].brightness.positive?
    end
  end

  def lights_on
    light_harness.values.count(&:lit?)
  end

  def brightness
    light_harness.values.sum(&:brightness)
  end

  private

  attr_accessor :light_harness
end

##
# This Rectangle exists to make generating coordinates more manageable.
#
class Rectangle
  attr_reader :coordinates

  def self.for coordinates1, coordinates2
    new(coordinates1, coordinates2)
  end

  def initialize origin, extent
    self.origin = origin
    self.extent = extent
    self.coordinates = []
    generate_coordinates
  end

  private

  attr_accessor :origin, :extent
  attr_writer :coordinates

  def generate_coordinates
    top_to_bottom_count.times do |y|
      left_to_right_count.times do |x|
        coordinates << "#{top + y},#{left + x}"
      end
    end
  end

  def bottom
    extent.split(',').first.to_i
  end

  def left
    origin.split(',').last.to_i
  end

  def right
    extent.split(',').last.to_i
  end

  def top
    origin.split(',').first.to_i
  end

  def left_to_right_count
    right - left + 1
  end

  def top_to_bottom_count
    bottom - top + 1
  end
end

##
# A simple light used in the grid
#
class Light
  attr_reader :brightness

  def initialize
    self.lit = false
    self.brightness = 0
  end

  def lit?
    lit
  end

  def on
    self.lit = true
    self.brightness += 1
  end

  def off
    self.lit = false
    self.brightness -= 1 unless brightness.zero?
  end

  def toggle
    self.lit = !lit
    self.brightness += 2
  end

  private

  attr_accessor :lit
  attr_writer :brightness
end
