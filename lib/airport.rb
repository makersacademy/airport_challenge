#Airport <-- allow_takeoff --> an Aeroplane
require_relative "aeroplane"

class Airport
  DEFAULT_CAPACITY = 5

  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def allow_takeoff
    fail "Not safe to allow take off" if not_safe?
    @planes.pop
  end

  def land(plane)
    fail "Airport too full to allow the plane to land" if full?
    @planes << plane
  end

  private

  attr_reader :planes

  def full?
    @planes.count >= capacity
  end

  def not_safe?
    @planes.empty?
  end

end
