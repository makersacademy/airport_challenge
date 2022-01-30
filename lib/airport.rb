require_relative "plane"

# @capacity = 1
def initialize
@planes = []
@capacity = 1
end

class Airport
  def land_plane(plane)
    fail "Airport full" if @capacity == @planes.size
    @planes << plane
    plane
  end


  def take_off(plane)
    fail "Plane has left airport" if @planes.empty?
    @planes.pop
  end

end

