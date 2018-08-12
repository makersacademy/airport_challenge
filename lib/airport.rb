require_relative 'plane'
require_relative 'weather'

class Airport
  
  attr_reader :capacity
  
  def initialize(capacity = 50, weather = Weather.new)
    @planes = []
    @capacity = capacity
    @weather = weather
  end

  def plane_land(plane)
    check_plane_can_land(plane)
    planes << plane
    plane.land_airport
  end

  def plane_take_off(plane)
    check_plane_can_take_off(plane)
    planes.delete(plane)
    plane.leave_airport
  end

  private
  attr_reader :planes, :weather
  
  def full?
    planes.count >= capacity
  end
  
  def check_plane_can_land(plane)
    fail "Bad weather, plane cannot land" if weather.stormy?
    fail "Plane already at airport" if plane.at_airport
    fail "Airport full, plane cannot land" if full?
  end

  def check_plane_can_take_off(plane)
    fail "Bad weather, plane cannot take off" if weather.stormy?
    fail "Plane not at airport" unless plane.at_airport
  end
end
