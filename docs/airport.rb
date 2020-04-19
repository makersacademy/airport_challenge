class Airport 
  
  attr_accessor :planes, :capacity

  def initialize(capacity = 10)
    @planes = []
    @capacity = capacity
  end

  def instruct_plane_to_land(plane)
    raise "Unable to land as Airport is full." if @planes.length >= @capacity
    raise "Weather too stormy to land." if stormy?
    @planes << plane
  end 

  def instruct_plane_to_takeoff(plane)
    raise "Weather too stormy to take off." if stormy?
    @planes.delete(plane)
  end 

  private

  def stormy? 
    rand(1..100) > 80 
  end 
end 
