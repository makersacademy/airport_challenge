require_relative 'Plane'

class Airport
  DEFAULT_CAPACITY = 20
  attr_reader :sunny
  attr_reader :capacity
  attr_accessor :planes


def initialize(capacity = DEFAULT_CAPACITY)
  @planes = []
  @capacity = capacity
  @weather = sunny
  #@landed =
  #plane.@landed = status
end
#find way to pass plane with attr into array
# somewhere do if plane.landed = false else raise_error
#NOW NEED TO PASS IN LANDED AND NOT LANDED PLANES
def land_plane#(plane_to_land = Plane.new)
  plane_to_land = Plane.new
  #raise_error(Runtimeerror)if plane_to_land.@landed = true
  #plane_to_land.landed = true
  @planes << plane_to_land
end


def takeoff_plane
  @planes.pop
end

def sunny
  #rand_number if 1 - 99
#if x7 @weather = stormy
#else @weather = sunny
#check 7x and impact of float

end

end
