require_relative "plane"

class Airport

attr_reader :planes

def initialize
  @planes = []
end

def taxi(plane)
  plane.landed = false
  planes.delete(plane)
end

end
