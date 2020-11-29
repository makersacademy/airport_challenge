require_relative 'plane'

class Airport

  attr_reader :capacity

  def initialize
    @capacity = capacity
    @stored_planes = []
  end

  def land(plane)
    raise StandardError.new "Airport is full" unless full?(@stored_planes) == false
    @stored_planes << plane
    @stored_planes[0]
  end
  
  def takeoff(plane) 
  end
end

private

def full?(array)
  array.count >= 20
end

