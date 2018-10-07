require_relative "plane"
class Airport
  attr_reader :planes
  attr_reader :capacity
  attr_reader :weather

  def initialize(capacity = 20, weather: Weather.new)
    @capacity = capacity
    @weather = weather
    @planes = []
  end

  def land(plane)
    fail "It is stormy, plane cant land" if @weather.stormy?
    fail "Airport full, plane cant land" if full?
    fail "Plane already on ground" if plane.landed?
    @planes.push(plane)
    plane.land
  end

  def take_off(plane)
    fail "Weather is stormy, plane cant take off" if @weather.stormy?
    fail "Plane already in the air" unless plane.landed?
    fail "Airport does not contain this plane" unless planes.include?(plane)
    @planes.delete(plane)
    plane.take_off
  end

  def full?
    return true if planes.count == @capacity
    return false
  end
end
