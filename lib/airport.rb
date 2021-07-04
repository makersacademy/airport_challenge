require_relative 'plane'

class Airport 
  attr_reader :capacity

  def initialize
    @capacity = 35
    @planes = []
  end

  def land(plane)
    raise "Airport is full!" if @planes.size >= @capacity
    @planes << plane
  end 

  def take_off
    @planes[-1].flying
    @planes.pop
  end

end 