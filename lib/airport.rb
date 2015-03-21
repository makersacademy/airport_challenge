class Airport
  DEFAULT_CAPACITY = 20
  attr_accessor :stationed_planes
  attr_reader :capacity
  def initialize(load_capacity = DEFAULT_CAPACITY)
    @stationed_planes = []
    @capacity = load_capacity
  end

  def arrival(plane)
    fail "Airport Full" if full?
    stationed_planes << plane
  end

  def departure(plane)
    fail "No Planes for departure" if empty?
    stationed_planes.delete(plane)
  end

  private

  def full?
    stationed_planes.length >= capacity
  end

  def empty?
    stationed_planes.empty?
  end
end
