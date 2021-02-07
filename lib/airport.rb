require "plane"

class Airport

  attr_reader :capacity
  
  def initialize(default_capacity = 10)
    @capacity = default_capacity
    @planes = []
  end 

  def land_plane(plane)
    if @planes.length >= @capacity
      fail "No space available at the airport"
    end 

    @planes << plane
  end

  def launch_plane(plane)
    fail "Cannot launch the plane because it is not at this airport" unless @planes.include? plane
    
    @planes.delete(plane)
    "Plane took off"
  end
  
end 
