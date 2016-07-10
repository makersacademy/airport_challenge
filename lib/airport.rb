require_relative 'weather'
require_relative 'plane'

class Airport
DEFAULT_CAPACITY = 20
attr_reader :capacity, :planes, :weather

def initialize(capacity = DEFAULT_CAPACITY)
  @weather = Weather.new
  @planes = []
  @capacity = capacity
end

def land(plane)
  fine_to_land?(plane)
  plane.land
  self.planes << plane
end

def take_off(plane)
  fine_to_take_off?(plane)
  plane.take_off
  planes.delete(plane)
end

def full?
  planes.count == capacity ? true : false
end

private

def fine_to_land?(plane)
  fail 'Plane is not in flight' if plane.landed
  fail 'Too stormy to land' if weather.stormy?
  fail 'Airport is too full to land' if full?
end

def fine_to_take_off?(plane)
  fail 'Plane is already in flight' if !plane.landed
  fail 'Plane is not at given airport' if !planes.include?(plane)
  fail 'Too stormy to take off' if weather.stormy?
end

end
