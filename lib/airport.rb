require_relative 'plane'

class Airport
  
  attr_reader :planes, :capacity
  
  def initialize(capacity = 50)
    @planes = []
    @capacity = capacity
  end

  def plane_land(plane)
    fail "Bad weather, plane cannot land" if weather_random <= 10
    fail "Airport full, plane cannot land" if full?
    fail "Plane already at airport" if @planes.include?(plane)
    @planes << plane
    plane.land_airport
  end

  def plane_take_off(plane)
    fail "Bad weather, plane cannot take off" if weather_random <= 10
    fail "Plane not at airport" unless @planes.include?(plane)
    @planes.delete(plane)
    plane.leave_airport
  end

  def weather_random
  	# if return value is less than or equal to 10, weather is stormy
    rand(100)
  end

  def full?
    @planes.count >= @capacity
  end

end
