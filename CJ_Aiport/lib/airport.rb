require_relative 'plane'

class Airport
  DEFAULT_CONSTANT = 10
  attr_reader :capacity
  def initialize(capacity=DEFAULT_CONSTANT)
    @capacity = capacity
    @planes = []
  end


  def landed(plane)
    fail "Not safe to land, airport is full!" if full?
    @planes << plane
  end

  def taken_off(plane)
    true
    @planes.pop
  end

  attr_reader :plane

  private

  attr_reader :planes


  def full?
    planes.count >= capacity
  end
end
