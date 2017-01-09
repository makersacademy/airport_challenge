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

# somewhere do if plane.landed = false else raise_error

def land_plane(plane_to_land = Plane.new)
  #raise_error(Runtimeerror)if plane_to_land.@landed = true
  raise 'Airport is closed due to stormy weather' if !sunny?
  raise 'Airport is full' if full?
  plane_to_land.land
  @planes << plane_to_land
end

def takeoff_plane
  taken_off = @planes.pop
  #raise_error 'No plane on ground' if taken_off.landed = false
end

private

def full?
    @planes.count >= @capacity
end

def sunny?
  (rand(10) < 10)? sunny = true : sunny=false
end
end
