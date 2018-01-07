require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    raise "Not possible to land due to stormy weather" if bad_weather
    planes << plane
    plane.landed
  end

  def take_off(plane)
    raise "Not possible to land due to stormy weather" if bad_weather
    planes.delete(plane)
    plane.taken_off
  end

  def bad_weather
    Weather.new.stormy?
  end

end
