require './lib/plane.rb'

class Airport
  attr_reader :plane
def release_plane
  plane = Plane.new
end

def land(plane)
  @plane = plane
end


end
