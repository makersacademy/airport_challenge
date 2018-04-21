require_relative 'plane'
require_relative 'weather'

class Airport

  def land(plane)
  end

  def takeoff(plane)
    raise "Unable to take off due to weather conditions" if stormy?
    "The #{plane} is no longer in the Airport"
  end

  private

  def stormy?
    weather_conditions = Weather.new
    weather_conditions.generate == "stormy"
  end

end
