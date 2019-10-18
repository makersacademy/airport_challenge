# frozen_string_literal: true

require_relative 'plane'

# Aiport class
class Airport
  attr_reader :planes

  def initialize
    @planes = []
    @capacity = 5
  end

  def land(_plane)
    planes << _plane
  end

  def take_off(_plane)
    planes.pop
  end

  def stormy?
    stormy
  end

  def full?
    planes.count >= capacity
  end
end
