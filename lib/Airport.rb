require_relative 'Plane'

class Airport
  DEFAULT_CAPACITY = 20
  attr_reader :sunny
  attr_reader :capacity

def initialize(capacity = DEFAULT_CAPACITY)
  @planes = []
  @capacity = capacity
end
def land_plane
  @planes << plane
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
