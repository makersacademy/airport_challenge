require './lib/plane.rb'
require './lib/weather.rb'

class Airport

  include Weather

  DEFAULT_CAPACITY = 5

  def initialize
    @planes = []
    @capacity = DEFAULT_CAPACITY
  end

  def land(plane)
    fail 'Unable to land plane, airport at capacity' if full?
    fail 'Weather is stormy' if stormy?
    plane.landed
    @planes << plane
  end

  def take_off(plane)
    fail 'Weather is stormy' if stormy?
    fail 'Airport is empty'  if empty?
    plane.has_taken_off
    @planes.pop
  end

  def full?
    @planes.count == @capacity
  end

  def empty?
    @planes.count == 0
  end

end
