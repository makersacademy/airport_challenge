require 'plane.rb'
require 'weather.rb'

class Airport

  include Weather
  attr_reader :planes
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def planes_in_airport
    @planes
  end

  def plane_count
    @planes.count
  end

  def full?
    plane_count >= @capacity
  end

  def land(plane)
    raise "Airport full" if full?
    raise "There's a storm" if stormy?
    @planes << plane
  end

  def takeoff(plane)
    raise "There's a storm" if stormy?
    @planes.delete(plane)
  end

end
