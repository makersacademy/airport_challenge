require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 20

  attr_reader :planes
  attr_accessor :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    fail "cannot land the plane: weather is stormy!" if stormy?
    fail "cannot land the plane: airport at capacity!" if full?
    plane.landed
    @planes.push(plane)
  end

  def take_off(plane)
    fail "cannot take off: weather is stormy!" if stormy?
    plane.in_flight
    @planes.pop
  end

  def stormy?
    rand(1..6) > 4
  end

  private

  def full?
    @planes.length >= @capacity
  end
end
