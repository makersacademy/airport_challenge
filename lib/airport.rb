require_relative 'plane'
class Airport
  DEFAULT_CAPACITY = 33
  attr_accessor :capacity
  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail 'Airport full' if full?
    
    @planes << plane
    @planes
  end

  private

  attr_reader :planes

  def full?
    planes.count >= @capacity
  end
end
