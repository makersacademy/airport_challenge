require_relative 'plane'

class Airport

  attr_reader :planes
  
  def initialize
    @planes = []
  end

  def plane_land(plane)
    fail "Bad weather, plane cannot land" if weather_random <= 10
    fail "Airport full, plane cannot land" if full?
  end

  def plane_take_off(plane)
    fail "Bad weather, plane cannot take off" if weather_random <= 10
    plane.leave_airport
  end

  def weather_random
  	# if return value is less than or equal to 10, weather is stormy
    rand(100)
  end

  def full?
  	# airport capacity is 1 plane
    !@planes.empty?
  end

end
