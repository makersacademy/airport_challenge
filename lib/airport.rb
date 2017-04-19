require 'plane'
require 'weather'

class Airport

  attr_reader :capacity

    DEFAULT_CAPACITY = 2

  def initialize(max = DEFAULT_CAPACITY)
    @capacity = max
    @planes = []
  end

  def
  def takeoff
    fail 'Delayed: weather is stormy' if @stormy_weather == true
    @flying = true
    planes.pop
    puts 'the plane has taken off'
  end

  def land
    fail 'Diversion: weather is stormy' if @stormy_weather == true
    @flying = false
    planes.push
    puts 'the plane has landed'
  end
end
