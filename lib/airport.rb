class Airport

DEFAULT_CAPACITY = 20
attr_reader :default_capacity

def initialize(def_capacity = DEFAULT_CAPACITY)
  @default_capacity = def_capacity
  @planes = []
end

def  instruct_plane_to_land(landing_plane)
  landing_plane.plane_landing
  @planes << landing_plane
  print "Plane: #{landing_plane} has landed. Status: #{landing_plane.instance_variable_get(:@plane_in_flight)}"
end


end
