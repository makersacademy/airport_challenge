require_relative 'plane'

class Airport
  def initialize(capacity)
    @capacity = 5
    @planes = []
  end

  attr_reader :plane

  def land(plane)
    fail 'Airport is full' if full?
    @planes << plane 
  end 

  def take_off #(plane)
    @plane = plane
    'Plane has taken off'
  end

  private 
  
  def full?
    @planes.length >= @capacity
  end
end