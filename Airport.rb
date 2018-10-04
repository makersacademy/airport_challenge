require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :weather
  attr_reader :plane

  def set_weather
    Weather.new
  end

  def land(plane)
    @plane = plane
  end

  def take_off(plane)
    @plane = nil
  end

end