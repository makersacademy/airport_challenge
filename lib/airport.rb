require_relative 'plane'

class Airport

  attr_reader :capacity

  def initialize
    @capacity = capacity
    @stored_planes = []
  end

  def land(plane)
    raise StandardError.new "Airport is full" unless full?(@stored_planes) == false
    raise StandardError.new "It is too stormy to land plane" if stormy? 

    @stored_planes << plane
    @stored_planes[0]
  end
  
  def takeoff(plane) 
    raise StandardError.new "It is too stormy to takeoff plane" if stormy?
  end
end

private

def full?(array)
  array.count >= 20
end

def stormy? 
  rand(1..6) > 4
end
