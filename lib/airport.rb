require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 50

  attr_reader :planes
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @stormy = false

  end

  def land(plane)
    Plane.new
    full?
    @planes << plane

  end

  def take_off
    Plane.new
    @planes.pop
  end

  def full?
    fail 'airport full, no landing' if @planes.length == @capacity
  end

  def stormy
    @stormy = true
  end
end
