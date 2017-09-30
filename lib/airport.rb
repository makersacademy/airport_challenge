require_relative 'aeroplane'
require_relative 'weather'

class Airport

  attr_reader :plane, :weather, :capacity

  def initialize(weather = Weather.new, capacity = 100)
    @weather = weather
    @capacity = capacity
  end

  def land(plane)
    plane.landed = true
    @plane = plane
  end

  def take_off(plane)
    fail 'Plane cannot take off due to storm' if weather.stormy?
    plane.landed = false
    @plane = plane
  end

end
