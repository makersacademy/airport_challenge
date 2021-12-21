require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 5
  attr_reader :planes, :capacity
  
  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    fail 'Airport is full' if full?
    @planes << plane 
  end 

  def take_off
    @planes.pop
  end

  private 

  def full?
    @planes.length >= @capacity
  end
end