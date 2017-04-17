class Plane

attr_reader :flying

def initialize
  @flying = true
end

def land_plane
  @flying = false
end

def plane_take_off
  @flying = true
end

end
