require_relative 'plane'

class Airport
  def plane_land(plane)
    fail "Bad weather, plane cannot land" if weather_random <= 10
  end

  def plane_take_off(plane)
    fail "Bad weather, plane cannot take off" if weather_random <= 10
    plane.leave_airport
  end

  def weather_random
  	# if return value is less than or equal to 10, weather is stormy
    rand(100)
  end
end
