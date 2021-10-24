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

  def self.stormy?
    rand < 0.10
  end

  def landing(plane)
    raise Airport.errors[0] if Airport.stormy?
    raise Airport.errors[1] unless plane.location == 'airborne'
    raise Airport.errors[2] unless @planes.length < @capacity
    @planes << plane
    plane.location = self
  end

  def take_off(plane)
    raise Airport.errors[3] unless @planes.include? plane
    raise Airport.errors[0] if Airport.stormy?
    plane.location = 'airborne'
    @planes.delete(plane)
  end

end