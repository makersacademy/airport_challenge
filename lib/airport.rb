require_relative "plane"
require_relative "weather"

class Airport
  
  attr_reader :planes
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail "Permission to land denied" unless (Weather).sunny?
    fail "Hangar is full, can't land" if full?
    @planes << plane
  end

  def take_off(plane)
    @planes.delete(plane)
  end

  private

  def full?
    @planes.count >= @capacity
  end
end
