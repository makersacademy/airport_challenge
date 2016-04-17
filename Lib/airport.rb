require_relative 'plane'
require_relative 'weather'

class Airport
  attr_accessor :planes, :capacity

  def initialize
    @planes = []
    @capacity = 1
  end

  def land(plane)
    raise "Too stormy to land" if stormy_weather?
    @planes << plane
  end

  def take_off(plane)
    raise "Too stormy for take off" if stormy_weather?
    plane = @planes.pop
  end

  def stormy_weather?
    Weather.new.stormy?
  end

  def full?
    @planes.length >= @capacity
  end
end
