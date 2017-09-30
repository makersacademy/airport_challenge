require_relative 'aeroplane'
require_relative 'weather'

class Airport

  attr_reader :weather, :capacity

  def initialize(weather = Weather.new, capacity = 100)
    @weather = weather
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    fail 'Airport full!' if @planes.count >= 100
    @planes << plane
    plane.landed = true
  end

  def take_off(plane)
    fail 'Airport empty!' if @planes.empty?
    # fail 'Plane cannot take off due to storm' if weather.stormy?
    @planes.pop
    plane.landed = false
  end

end
