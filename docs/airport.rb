require './docs/plane.rb'


class Airport

def initialize
  @planes = []
end

attr_reader :planes
attr_accessor :planes

def create_planes
  plane = Plane.new
  @planes << plane
end

def show_planes_in_airport
 p "#{:planes}"
end

def take_off(plane)
  p "#{plane} has taken off"
  p "#{plane} is no longer at the airort"
  @planes.delete(plane)
#but this does not reset the orignal Airport.new instance which was created
end

def landing(plane)
  p "#{plane} has landed"
  planes_in_airport(plane)
end

end
