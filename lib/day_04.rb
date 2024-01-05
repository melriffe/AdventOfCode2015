# frozen_string_literal: true

require 'digest'

##
# --- Day 4: The Ideal Stocking Stuffer ---
# https://adventofcode.com/2015/day/4
#
class Day04
  attr_accessor :data, :lowest_number, :regexp

  def self.calculate data, regexp = /^0{5}/
    new(data, regexp).calculate
  end

  def initialize data, regexp
    self.data = data
    self.regexp = regexp
    self.lowest_number = 0
  end

  ##
  # Given a secret key (the `data`) find a value whose MD5 starts with 5 zeroes.
  #
  def calculate
    self.lowest_number += 1 until number_found?
    self
  end

  def number_found?
    md5_hash.match?(regexp)
  end

  def md5_hash
    Digest::MD5.hexdigest input
  end

  def input
    "#{data}#{lowest_number}"
  end
end
