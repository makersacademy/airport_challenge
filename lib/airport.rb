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
end


end
