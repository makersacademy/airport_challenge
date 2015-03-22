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
    fail "Too Stormy" if stormy?
    stationed_planes << plane
  end

  def departure(plane)
    fail "No plane" if empty?
    fail "Too Stormy" if stormy?
    stationed_planes.delete(plane)
  end

  private

  def full?
    stationed_planes.length >= capacity
  end

  def empty?
    stationed_planes.empty?
  end

  def forecast
    rand(1..5) < 5 ? :sunny : :stormy
  end

  def stormy?
    forecast == :stormy
  end
end
