require_relative 'plane'  # => true

class Airport

  attr_reader :planes, :capacity  # => nil

DEFAULT_CAPACITY = 20  # => 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    raise 'Airport is full!' if full?
    raise 'Plane has already landed and is in airport' if planes.include?(plane)
    raise 'Landing denied. Weather is stormy!' if stormy?
    planes << plane
  end

  def take_off
    raise 'Cannot take-off an already flying plane' unless planes.length > 0
    raise 'Take-off denied. Weather is stormy!' if stormy?
    planes.pop
  end

  def stormy?
    rand(0..1.0) > 0.8
  end

  private                      # => Airport
  def full?
    planes.length >= capacity
  end

end
