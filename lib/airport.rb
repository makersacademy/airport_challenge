require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :planes
  DEFAULT_CAPACITY = 30

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @planes = []
    @capacity = capacity
    @weather = weather
  end

  def try_to_land(plane)
    raise "Currently unsafe to land plane" if stormy?
    raise "Airport currently full" if full?
    raise "This plane is already landed" if plane.flying == false
    land(plane)
  end

  def land(plane)
    plane.landing
    planes << plane
  end

  def try_to_takeoff(plane)
    raise "Currently unsafe for plane to take off" if stormy?
    raise "Plane is already in the air" if plane.flying == true
    message = "This plane is not currently in the airport and so cannot take off"
    raise message unless plane_in_airport?(plane)
    takeoff(plane)
  end

  def takeoff(plane)
    plane.taking_off
    planes.delete(plane)
  end

  def stormy?
    weather.stormy?
  end

  private
  attr_reader :weather
  def full?
    planes.size >= @capacity
  end

  def plane_in_airport?(plane)
    planes.include?(plane)
  end
end
