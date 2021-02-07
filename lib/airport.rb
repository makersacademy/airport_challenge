require "plane"

class Airport
  DEFAULT_CAPACITY = 10
  def initialize
    @planes = []
  end 

  def land_plane(plane)
    if @planes.length >= DEFAULT_CAPACITY
      fail "No space available at the airport"
    end 

    @planes << plane
  end

  def launch_plane(plane)
    "Plane took off"
  end

end 
