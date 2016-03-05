require_relative 'plane'

class Airport
DEFAULT_CAPACITY = 20

attr_reader :planes

def initialize(capacity=DEFAULT_CAPACITY)
  @planes = []
  @capacity = capacity
end

def land_plane(plane)
raise "CANNOT LAND IN A STORM" if stormy?
raise "CANNOT LAND AIRPORT IS FULL" if full?
    @planes << plane
end

def plane_take_off(plane)
raise "CANNOT TAKE-OFF IN A STORM"if stormy?
    @planes.reject! {|plane| plane == plane}
end

private

def stormy?
  number = rand(0..10)
  number == 5 ? true : false
end

def full?
  @planes.length == @capacity ? true : false
end

end
