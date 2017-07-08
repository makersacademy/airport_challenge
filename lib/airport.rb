require 'plane'
require 'weather'

class Airport

  include Weather
  attr_reader :planes
  attr_accessor :capacity
  DEFAULT_CAPACITY = 20

  def initialize (capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land plane
    raise 'airport is full' if full?
    plane.land
    @planes << plane
  end

  def take_off plane
    raise "Take off prevented due to stormy weather" if stormy?
    plane.take_off
    @planes.delete(plane)
  end

  def plane_count
    planes.count
  end

  private

  def full?
    plane_count == capacity
  end

end
