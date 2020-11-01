require_relative "plane"

class Airport

  def land_plane(plane)
    fail "There is already a plane landed" if @plane
    
    @plane = plane
  end

  def take_off
    return "The plane has left"
  end
end
