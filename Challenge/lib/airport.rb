require_relative 'plane'
require_relative 'weather'


class Airport

attr_reader :planes
attr_reader :capacity
attr_reader :weather

def initialize(capacity=2)
@planes = []
@capacity = capacity 
@weather = Weather.new

end

def land_plane(plane)
  fail "Docking station is full" if full?
  @planes << plane
end

def take_off(plane)
  fail "Too stormy to land" if @weather.stormy?
  @planes.delete(plane)
end

private

def full?
  @planes.count >= capacity
end


end


