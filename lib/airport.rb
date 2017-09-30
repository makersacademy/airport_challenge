require_relative 'aeroplane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY=10

  attr_reader :weather, :capacity

  def initialize(weather = Weather.new, capacity = DEFAULT_CAPACITY)
    @weather = weather
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    fail 'Airport full!' if full?
    @planes << plane
    plane.landed = true
  end

  def take_off(plane)
    fail 'Airport empty!' if empty?
    # fail 'Plane cannot take off due to storm' if weather.stormy?
    @planes.pop
    plane.landed = false
  end

  private
  def full?
    @planes.count >= capacity
  end

  def empty?
    @planes.empty?
  end
end
