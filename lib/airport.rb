class Airport
  attr_reader :capacity
  attr_reader :runway

  def initialize(capacity = 5) 
    @runway = []
    @capacity = capacity
  end 

  def land_plane(flying_plane)
    @runway << flying_plane
  end

  def takeoff_plane(takeoff_plane)
    @runway.delete(takeoff_plane)
  end
end
