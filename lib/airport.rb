require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :plane_list, :weather

  def initialize(weather = Weather.new)
    @plane_list = []
    @weather = weather
  end

  def land(plane)
    @plane_list << plane
  end

  def take_off
    raise 'Cannot take off due to stormy weather' if weather.stormy?
    @plane_list.pop
  end

end
