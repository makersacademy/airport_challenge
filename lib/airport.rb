require_relative "plane"

class Airport
  attr_accessor :capacity, :planes
  DEFAULT_CAPACITY = 500

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def airport_capacity(capacity)
    @capacity
  end

  def land(plane)
    fail "Airport is full" if full?
      @planes << plane
    end

  def full?
    @planes.count >= capacity
  end

end
