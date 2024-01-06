# frozen_string_literal: true

##
# --- Day 2: I Was Told There Would Be No Math ---
# https://adventofcode.com/2015/day/2
#
class Day02
  attr_accessor :data, :wrapping_paper_order, :ribbon_order

  def self.calculate data
    new(data).calculate
  end

  ##
  # NOTE: `data` ia assumed to be an array of "formulas"
  def initialize data
    self.data = data
    self.wrapping_paper_order = self.ribbon_order = 0
  end

  ##
  # NOTE: The incoming 'data' is a series of "formulas": '2x3x4'
  def calculate
    data.each do |datum|
      gift = Present.new datum.split('x')
      self.wrapping_paper_order += gift.wrapping_paper_required
      self.ribbon_order += gift.ribbon_required
    end
    self
  end
end

##
# Represent the Present that is to be wrapped by Santa's Elves.
class Present
  def initialize dimensions
    self.height = dimensions.pop.to_i
    self.width = dimensions.pop.to_i
    self.length = dimensions.pop.to_i
  end

  ##
  # Every present is a box (a perfect right rectangular prism), which makes
  # calculating the required wrapping paper for each gift a little easier:
  #   find the surface area of the box, which is 2*l*w + 2*w*h + 2*h*l.
  #
  # The elves also need a little extra paper for each present:
  #   the area of the smallest side.
  #
  def wrapping_paper_required
    surface_area + smallest_side_area
  end

  ##
  # The ribbon required to wrap a present is the shortest distance around its
  # sides, or the smallest perimeter of any one face. Each present also
  # requires a bow made out of ribbon as well; the feet of ribbon required
  # for the perfect bow is equal to the cubic feet of volume of the present.
  # Don't ask how they tie the bow, though; they'll never tell.
  #
  def ribbon_required
    smallest_side_perimeter + volume
  end

  private

  attr_accessor :length, :width, :height

  def surface_area
    length_surface_area + width_surface_area + height_surface_area
  end

  def length_surface_area
    2 * length * width
  end

  def width_surface_area
    2 * width * height
  end

  def height_surface_area
    2 * height * length
  end

  def smallest_side_area
    dimensions = smallest_dimensions
    dimensions[0] * dimensions[1]
  end

  def smallest_dimensions
    [length, width, height].sort[0, 2]
  end

  def smallest_side_perimeter
    dimensions = smallest_dimensions
    (2 * dimensions[0]) + (2 * dimensions[1])
  end

  def volume
    length * width * height
  end
end
