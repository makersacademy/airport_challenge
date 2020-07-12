require 'plane.rb'
class Airport
  attr_reader :capacity, :sky, :airport
  attr_accessor :planes

  DEFAULT_CAPACITY = 100

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
    @sky = []
  end

  def land(plane)
    raise "plane not in flight" unless plane.flying == true

    raise "too stormy to land" if stormy?

    raise "airport is full" if full?

    @planes << plane
    "plane landed"
  end

  def takeoff(plane)
    raise "too stormy to take off" if stormy?

    @planes.delete(plane)
    @sky << plane
    "plane has taken off"
  end

  def stormy?
    rand(5) == 1
  end

  def full?
    @planes.count >= @capacity
  end

end
