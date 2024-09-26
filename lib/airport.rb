require_relative 'plane'
require_relative 'weather'

class Airport
    
DEFAULT_CAPACITY = 50
attr_reader :planes

def initialize(weather, capacity = DEFAULT_CAPACITY)
  @capacity = capacity
  @weather = weather
  @planes = []
  
end
    

def land(plane)
  raise 'Plane cannot land because airport is at capacity'if DEFAULT_CAPACITY?
  raise 'Planes cannot land during stormy weather'if weather.stormy?
     planes << plane
     add_plane(plane)
end

def take_off(plane)
  raise 'Plane cannot take off during stormy weather'if weather.stormy?
  raise 'Confirm plane has taken off and is no longer at airport'unless at_airport?(plane)
  plane.take_off
  remove_plane(plane)
  plane
end

private
attr_reader :capacity, :weather

def capacity?
  planes.length >= DEFAULT_CAPACITY
end

def stormy?
  weather.stormy?
end

def at_airport?
  planes.include?(plane)
end

def add_plane(plane)
  planes << plane
end

def remove_plane(plane)
  planes.pop
end

end