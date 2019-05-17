require_relative '../lib/weather'

class Airport
  attr_reader :hangar

  def initialize
    @hangar = []
  end

  def land(plane, weather = Weather.new)
    raise 'Airport currently closed due to stormy weather' if weather.stormy?
    @hangar << plane
  end

  def take_off(plane, weather = Weather.new)
    raise 'Planes grounded: stormy weather!' if weather.stormy?
    @hangar.delete(plane)
  end
end