require 'weather'
require 'plane'

class Airport
  attr_reader :at_airport, :capacity, :weather, :plane

  AIRPORT_CAPACITY = 50

  def initialize(capacity=AIRPORT_CAPACITY)
    @capacity = capacity
    @at_airport = []
    @weather = Weather.new
    @plane = Plane.new
  end

  def land(plane)
    raise 'Error: Airport full!' if full?
    raise "Error: Too stormy, can't land!" if stormy?
    raise "Error: Can't land a non-flying plane" unless flying?
    @at_airport << @plane
    @at_airport.last

  end

  def depart(plane)
    raise "Error: Too stormy, can't depart!" if stormy?
    @at_airport.delete(plane)
  end

  private

  def full?
    at_airport.size >= capacity
  end

  def stormy?
    @weather.stormy?
  end

  def flying?
    plane.flying?
  end

end
