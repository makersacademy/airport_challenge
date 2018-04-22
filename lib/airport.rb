class Airport

attr_accessor :planes

def initialize
  @planes = []
end

def land(plane)
  @planes << plane
end

def take_off(plane)
  @planes.delete(plane)
end

def is_plane_present(plane)
  @planes.include?(plane)
end

end
