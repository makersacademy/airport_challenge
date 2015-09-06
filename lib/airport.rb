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
    fail 'Airport at capacity' if full?
    fail 'Weather is stormy' if weather_cond == "stormy"
    plane.landed
    @planes << plane
  end

  def take_off(plane)
    fail 'Weather is stormy' if weather_cond == "stormy"
    fail 'Airport is empty'  if empty?
    plane.taken_off
    @planes.pop
  end

  def plane_total
    @planes.count
  end

  def full?
    plane_total == @capacity
  end

  def empty?
    plane_total == 0
  end

end
