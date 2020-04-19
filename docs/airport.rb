class Airport 
  
  attr_accessor :planes, :capacity

  def initialize(capacity = 10)
    @planes = []
    @capacity = capacity
  end

  def instruct_plane_to_land(plane)
    @planes << plane unless full?
  end 

  def instruct_plane_to_takeoff(plane)
    @planes.delete(plane)
  end 

  private

  def full?
    fail "Unable to land as Airport is full." if @planes.length >= @capacity
  end 
end 
