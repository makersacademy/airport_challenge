class Airport

  attr_reader :planes, :capacity

  DEFAULT_CAPACITY = 3

  @@errors = [
    'It is too stormy',
    'Plane already landed',
    'The airport is full.',
    'You are not at this airport'
  ]

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def self.errors
    @@errors
  end

  def stormy?
    rand < 0.10
  end

  def landing(plane)
    plane.land(self)
    raise Airport.errors[0] if Airport.stormy?
    raise Airport.errors[2] unless @planes.length < @capacity
    @planes << plane
  end

  def take_off(plane)
    raise Airport.errors[3] unless @planes.include? plane
    raise Airport.errors[0] if Airport.stormy?
    @planes.delete(plane)
    plane.take_off
  end

end