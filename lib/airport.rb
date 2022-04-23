require_relative 'plane'

class Airport
  
  DEFAULT_CAPACITY = 5

  attr_reader :planes, :capacity, :weather

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail 'Airport full' if full?
    @planes << plane
  end

  def take_off(plane)
    @planes.delete(plane)
  end

  private

  def full?
    @planes.length >= @capacity
  end
          
end