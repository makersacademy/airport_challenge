require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :planes, :weather

  def initialize(weather: Weather.new)
    @planes = []
    @weather = weather
  end

  def land(plane)
    raise 'Cannot land a plane in stormy weather' if weather.stormy?
    @planes << plane
  end

  def take_off(plane)
    raise 'Cannot take off due to stormy weather' if weather.stormy?
    @planes.pop
  end

end