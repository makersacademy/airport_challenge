require_relative 'plane'

class Airport
  def initialize(capacity)
    @capacity = 5
    @planes = []
  end

  attr_reader :plane

  def land(plane)
    fail 'Airport is full' if @planes.length >= @capacity
    @planes << plane 
  end 

  def take_off #(plane)
    @plane = plane
    'Plane has taken off'
  end
end