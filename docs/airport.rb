

class Airport 
  
  attr_accessor :planes, :capacity

  def initialize(capacity = 10)
    @planes = []
    @capacity = capacity
  end

  def instruct_plane_to_land(plane)
    raise "Unable to land as Airport is full." if full?
    raise "Weather too stormy to land." if stormy?
    
    @planes << plane
  end 

  def instruct_plane_to_takeoff(plane)
    raise "Weather too stormy to take off." if stormy?
    @planes.delete(plane)
  end 

  private

  def full?
    @planes.length >= @capacity
  end 

  def stormy?
    rand(0..100) > 90
  end
end 