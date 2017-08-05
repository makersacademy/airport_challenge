require './docs/plane.rb'

class Airport

def initialize
  @planes = []
end

attr_reader :planes


def create_planes
  plane = Plane.new
  @planes << plane
end

def planes_in_airport(plane)
 @planes << plane
end

def take_off(plane)
  p "#{plane} has taken off"
  p "#{plane} is no longer at the airort"
  @planes.delete(plane)
end

def landing(plane)
  p "#{plane} has landed"
  planes_in_airport(plane)
end

end
