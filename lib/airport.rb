require 'weather.rb'

class Airport

  attr_reader :planes
  DEFAULT_CAPACITY = 20
  
  def initialize(weather = Weather.new, capacity = 99)
    @planes = []
    @weather = weather
    @capacity = capacity
  end

  def land(plane)
    raise "Unable to land, stormy weather." if @weather.stormy?
    raise "Unable to land, airport full." if full?
    @planes << plane
  end

  def take_off(plane)
    raise "Unable to take off, stormy weather." if @weather.stormy?
    @planes.delete(plane)
  end

private
  def full?
    @capacity == @planes.count
  end

end
