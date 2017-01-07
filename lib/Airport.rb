require_relative 'Plane'

class Airport
  DEFAULT_CAPACITY = 20
  attr_reader :sunny
  attr_reader :capacity
  attr_accessor :planes

def initialize(capacity = DEFAULT_CAPACITY)
  @planes = []
  @capacity = capacity
  @sunny = true
end

#creates new plane has to be in air for it to land
#stored in array- PASS PLANE IN
def land_plane(plane_to_Land)
  raise "Airport is full" if full?
  plane_to_Land.land
  @planes << plane_to_Land
end

def takeoff_plane
  #raise "No planes at airport" if no_planes?
  plane = @planes.pop
  plane.takeoff
end

def sunny
  #rand_number if 1 - 99
#if x7 @weather = stormy
#else @weather = sunny
#check 7x and impact of float
end

def full?
  @planes.count >= @capacity
end

# def no_planes?
# end

end
