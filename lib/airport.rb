require_relative 'plane.rb'
require_relative 'weather.rb'

class Airport

DEFAULT_CAPACITY = 1

  attr_reader :weather
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @weather = Weather.new
  end

  def land(plane)
    fail "Plane already in airport" if in_airport?(plane)
    fail "Airport is full" if full?
    fail "Too stormy to land" if stormy?
    plane.land
    @planes << plane
  end

  def take_off(plane)
    fail "Plane is not in airport" unless in_airport?(plane)
    fail "Too stormy to take off" if stormy?
    plane.take_off
    @planes.delete(plane)
  end

  def in_airport?(plane)
    @planes.include?(plane)
  end

  private

  attr_reader :planes

  def full?
    @planes.count >= capacity
  end

  def stormy?
    @weather.stormy?
  end

end
