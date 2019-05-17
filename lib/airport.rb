require_relative '../lib/weather'

class Airport
  attr_reader :hangar

  def initialize
    @hangar = []
  end

  def land(plane)
    @hangar << plane
  end

  def take_off(plane, weather = Weather.new)
    raise 'Planes grounded: stormy weather!' if weather.stormy? == true
    @hangar.delete(plane)
  end
end