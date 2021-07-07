require_relative "plane"
require_relative "weather"

class Airport
  MAX_CAPACITY = 20
  attr_accessor :capacity, :weather

  def initialize(capacity = MAX_CAPACITY)
    @capacity = 20
    @planes = []
    @weather = Weather.new
  end

  def land(plane)
    fail "Airport is chock full of planes" if full?
    fail "Weather is too turbulant to land" if stormy?
    plane.land
    planes << plane
  end

  def take_off(plane)
    fail "No planes left" unless planes.include?(plane)
    fail "Weather is too turbulant to take off" if stormy?
    plane.take_off
    planes.delete(plane)
  end

  private

  attr_reader :plane

  def full?
    planes.count == capacity
  end

  def stormy?
    weather.stormy?
  end
end