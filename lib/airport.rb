require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :plane

  def land(plane)
    "plane landed"
  end

  def takeoff(plane)
    "plane took off!"
  end

  def weather_check
    #have to actually make an instance of the Weather class
    weather = Weather.new
    weather::weather_status
  end

end
