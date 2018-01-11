require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :planes, :weather, :capacity

  DEFAULT_CAPACITY = 2

  def initialize(weather = Weather.new, capacity = DEFAULT_CAPACITY)
    @planes = []
    @weather = weather
    @capacity = capacity
  end

  def land(plane)
    fail "Stormy weather" if weather.stormy?
    fail "Plane has already landed" unless plane.airborne?
    fail "Airport is full" if full?
    plane.land
    @planes << plane
  end

  def take_off(plane)
    fail "Stormy weather" if weather.stormy?
    fail "Plane has already taken off" if plane.airborne?
    fail "Airport is empty" if planes.empty?
    plane.takeoff
    @planes.delete(plane)
    confirm_take_off(plane)
  end

  def confirm_take_off(plane)
    "Confirmed: #{plane} has taken off"
  end

  def full?
    return true if @planes.length == @capacity
    false
  end

end
