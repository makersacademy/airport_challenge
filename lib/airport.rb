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
    plane.flying? ? (planes << plane; plane.landed) : 'Plane has already landed'
  end

  def take_off
    raise 'No planes at airport' unless planes_available?
    raise 'Take-off denied. Weather is stormy!' if stormy?
    planes.pop.flying
  end

  def full?
    planes.length >= capacity
  end

  def planes_available?
    planes.length > 0
  end

  def stormy?
    probability(0..1.0) > 0.95
  end

  private

  def probability(x)
    rand(x)
  end

end
