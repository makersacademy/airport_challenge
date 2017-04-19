require_relative "plane.rb"
require_relative "weather.rb"

class Airport

  DEFAULT_CAPACITY = 25

  attr_accessor :ground_fleet, :capacity, :weather

  def initialize(capacity = DEFAULT_CAPACITY)
    @ground_fleet = []
    @weather = Weather.new
    @capacity = capacity

  end

  def land(plane)
    fail "Landing not possible, airport at full capacity" if full?
    fail "No landing due to weather conditions." if storms?
    fail "The plane has already landed" if plane.landed?
    plane.ground
    ground_fleet << plane
  end

  def take_off(plane)
    fail "No taking off due to weather" if storms?
    fail "The plane has already taken off" if plane.on_air?
    fail "Plane not in this aiport" unless ground_fleet.include?(plane)
    plane.flying
    ground_fleet.delete(plane)
  end

  def in_airport?(plane)
    ground_fleet.include?(plane) ? true : false
  end

  def storms?
    weather.stormy?
  end

  def full?
    ground_fleet.count >= capacity
  end

end
