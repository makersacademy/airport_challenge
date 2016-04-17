require_relative 'plane'

class Weather

  def weather_calc(plane)
    if rand(20) > 17
      fail "Planes cannot take off due to stormy weather" if plane.ground
      fail "Planes cannot land due to stormy weather" unless plane.ground
    end
  end
end
