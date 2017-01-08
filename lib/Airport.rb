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
  #plane.@landed = status
end
#find way to pass plane with attr into array
# somewhere do if plane.landed = false else raise_error
#NOW NEED TO PASS IN LANDED AND NOT LANDED PLANES

def land_plane(plane_to_land = Plane.new)
  #plane_to_land = Plane.new
  #raise_error(Runtimeerror)if plane_to_land.@landed = true
  #plane_to_land.landed = true
  raise 'Airport is closed due to stormy weather' if sunny?
  raise 'Airport is full' if full?
  plane_to_land.land
  @planes << plane_to_land

end

def takeoff_plane
  taken_off = @planes.pop
  #raise_error 'No plane on ground' if taken_off.landed = false
end

def full?
    @planes.count >= @capacity
end

def sunny?
  if (rand(100) < 0) then sunny = true
  else   sunny = false
  end
end
end
