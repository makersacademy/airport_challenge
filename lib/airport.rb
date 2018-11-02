require_relative 'plane'
require_relative 'weather'

class Airport
  def initialize(weather: Weather.new)
    @hangar = []
    @weather = weather
  end

  def land(plane)
    @hangar << plane
    plane.land
  end

  def take_off(plane)
    raise 'Cannot take off due to stormy weather' if @weather.stormy?
    @hangar.pop
    #plane.take_off
  end

  private
  attr_reader :weather

  def hangar
    @hangar
  end
end
