require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :plane

  def land(plane)
    fail "too inclement for landing!" unless weather_check == "balmy"
    "plane landed"
  end

  def takeoff(plane)
    fail "too inclement for flight!" unless weather_check == "balmy"
    "plane took off!"
  end

  def weather_check
    weather = Weather.new
    weather::weather_status
  end

end
