class Airport
require_relative 'plane'

attr_reader :airp

def initialize
  @airp = []
  
end

def land_plane(plane)
  add_plane(plane)
end

def plane_take_off(plane)
  remove_plane(plane)
end

def add_plane(plane)
  @airp << plane
end

def remove_plane(plane)
  @airp.pop
end

# def plane_count
#   @plane_count
# end

# def plane
#   Plane.new
# end

end
