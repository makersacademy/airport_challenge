require_relative flying.rb

class Airport
  include Flying
  DEFAULT_CAPACITY = 3

  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def landed_planes(plane)
    fail "The Airport is full" if full?
    planes << plane
  end


  private

  attr_reader :planes

  def full?
    planes.size >= capacity
  end
end
