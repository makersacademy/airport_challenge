require_relative 'plane'

class Airport

attr_reader :planes
attr_reader :capacity
  
  def initialize
    @planes = []
    @capacity = 10
  end

  def land_plane(plane)
    fail 'The airport is full' if full?
    @planes.push(plane)
  end

def takeoff_plane
  @planes.pop
end

def full?
  true if @planes.count >= @capacity
end 


end