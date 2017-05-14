require_relative "plane.rb"
require_relative "weather.rb"

class Airport

  DEFAULT_CAPACITY = 25

  attr_accessor :ground_fleet
  attr_accessor :capacity


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
    @ground_fleet << plane
  end

  def take_off(plane)
    fail "No taking off due to weather" if storms?
    fail "The plane has already taken off" if plane.on_air?
    plane.flying
    @ground_fleet.delete(plane)
  end

  def in_airport?(plane)
    if @ground_fleet.include?(plane)
      true
    else
      false
    end
  end

  def storms?
    @weather.stormy?
  end

  def full?
    true if @ground_fleet.count >= @capacity
  end

end
