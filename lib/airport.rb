class Airport

  attr_reader :stored_planes
  attr_accessor :capacity

  DEFAULT_CAPACITY = 15

  def initialize(capacity=DEFAULT_CAPACITY)
    @stored_planes = []
    @capacity = capacity
  end

  def store(plane)
    raise 'Plane cannot land, Airport is full!' if full?
    @stored_planes << plane
  end


private

  def full?
    @stored_planes.length >= capacity
  end

end