require_relative 'plane'

class Airport
attr_reader :planes
attr_accessor :capacity

DEFAULT_CAPACITY = 15
  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @stormy = [true,false].sample
    @capacity = capacity

  end

  def stormy?
    @stormy
  end

  def land(plane)
    fail 'airport is full' if full?
    @planes << plane
  end

  def take_off
    @planes.pop
  end

  def full?
    planes.size >= capacity ? true : false
  end
end
