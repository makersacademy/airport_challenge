require 'weather'
require 'plane'

class Airport
  DEFAULT_CAPACITY = 1

  attr_reader :planes

  def initialize( weather, capacity=DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @weather = weather
  end

  def land( plane)
    raise "Airport is full" if full?
    raise "Weather is stormy" if @weather.stormy?
    plane.land
    @planes.push plane
  end

  def dispatch( plane)
    raise "Plane is not at airport" unless @planes.include?plane
    raise "Weather is stormy" if @weather.stormy?
    plane.take_off
    @planes.delete(plane)
  end

  private
  def full?
    @planes.length == @capacity
  end
end