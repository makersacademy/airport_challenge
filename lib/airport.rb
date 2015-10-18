require_relative 'plane'

class Airport

  attr_reader :planes, :capacity

DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    raise 'Airport is full!' if full?
    raise 'Landing denied. Weather is stormy!' if stormy?
    planes << plane
    plane.landed
  end

  def take_off
    raise 'No planes at airport' unless planes.length > 0
    raise 'Take-off denied. Weather is stormy!' if stormy?
    planes.pop.flying
  end

  private

  def stormy?
    rand(0..1.0) > 0.95
  end

  def full?
    planes.length >= capacity
  end

end
