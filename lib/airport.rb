require_relative 'plane'

class Airport

  attr_reader :planes, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @stormy = false
  end

  def instruct_to_land(plane)
    raise "The airport is full" if @planes.length >= @capacity
    raise "Weather is too stormy to land" if stormy?
    plane.at_airport(self)
    @planes << plane
  end

  def instruct_to_take_off(plane)
    raise "Weather is too stormy to take off" if stormy?
    raise "Plane flying cannot take off" if plane.flying?
    @planes.delete(plane)
  end

  def report_stormy
    @stormy = true
  end

  def stormy?
    @stormy
  end

end
