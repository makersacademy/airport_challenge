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
    raise 'Airport full!' if full?
    raise "Stormy, can't land" if stormy?
    raise "Plane already landed" unless flying?
    @at_airport << @plane
    @at_airport.last


  end

  def depart(plane)
    raise "Stormy, can't depart" if stormy?
    raise "Plane already flying" if flying?
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
