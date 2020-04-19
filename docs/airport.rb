class Airport 
  CAPACITY = 1
  attr_accessor :planes

  def initialize
    @planes = []
  end

  def instruct_plane_to_land(plane)
    @planes << plane unless full?
  end 

  def instruct_plane_to_takeoff(plane)
    @planes.delete(plane)
  end 

  private

  def full?
    fail "Unable to land as Airport is full." if @planes.length >= CAPACITY
  end 
end 
