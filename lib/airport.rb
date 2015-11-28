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
  puts "Plane: #{landing_plane} has landed. Status: #{landing_plane.instance_variable_get(:@plane_in_flight)}"
end

def instruct_plane_to_take_off(departing_plane)
  departing_plane.plane_taking_off
  @planes.delete(departing_plane)
  puts "Plane: #{departing_plane} has departed. Status: #{departing_plane.instance_variable_get(:@plane_in_flight)}"
end

end
