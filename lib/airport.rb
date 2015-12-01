require_relative 'plane'
require_relative 'weather'

class Airport
  include Weather


  attr_reader :planes, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def instruct_to_land(plane)
    raise "The airport is full" if full?
    raise "Weather is too stormy to land" if stormy?
    raise "Plane already landed" if !plane.flying?
    plane.at_airport(self)
    plane.land
    planes << plane
  end

  def instruct_to_take_off(plane)
    raise "Weather is too stormy to take off" if stormy?
    raise "Plane flying cannot take off" if plane.flying?
    raise "Must be the correct airport" if plane.airport != self
    plane.take_off
    planes.delete(plane)
  end

  private

  def full?
    planes.length >= capacity
  end

end
