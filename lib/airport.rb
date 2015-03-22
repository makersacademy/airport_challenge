class Airport
  DEFAULT_CAPACITY = 20
  attr_accessor :stationed_planes
  attr_reader :capacity
  def initialize(load_capacity = DEFAULT_CAPACITY)
    @stationed_planes = []
    @capacity = load_capacity
  end

  def arrival(plane, forecast = :sunny)
    fail "Airport Full" if full?
    fail "Too Stormy" if forecast == :stormy
    stationed_planes << plane
  end

  def departure(plane, forecast = :sunny)
    fail "No plane" if empty?
    fail "Too Stormy" if forecast == :stormy
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
