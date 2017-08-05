require './docs/plane.rb'

class Airport

  attr_reader :planes

def initialize
  @planes = []
end

def create_planes
  planez = Plane.new
  @planes << planez
end

def take_off(plane)
  p "#{plane} has taken off"
  p "#{plane} is no longer at the airort"
  @planes.delete(plane)
end

def landing(plane)
  p "#{plane} has landed"
end

end
