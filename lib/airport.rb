require_relative 'plane'
require_relative 'weather'

class Airport

attr_reader :hanger, :weather, :capacity

DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @hanger = []
    @weather = weather
    @capacity = capacity
  end

  def land(plane)
    fail "Too stormy to land." if weather.stormy?
    fail "Airport at maximum capacity." if full?
    fail "Flight #{plane} has already landed." if @hanger.include?(plane)
    plane.landed
    plane_landed(plane)
  end

  def plane_landed(plane)
    hanger << plane
    "Flight #{plane} has landed at the airport."
  end

  def empty?
    hanger.empty?
  end

  def full?
    hanger.count >= capacity
  end

  def take_off
    fail "Too stormy to take off." if weather.stormy?
    fail "There are no planes in the hanger." if empty?
    fail "Flight has already taken off." if @hanger.last.airborne
    taken_off
  end

  def taken_off
    departure = hanger.pop
    departure.flying
    "Flight #{departure} has taken off from the airport."
  end

end
