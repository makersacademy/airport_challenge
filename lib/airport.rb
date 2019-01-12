require_relative 'plane'

class Airport

attr_reader :plane

def initialize
  @planes = []

def land (plane)
  @planes << plane
  return plane
end

def take_off (plane)
  @planes - [plane]
  return @planes.include?(plane) 
  end
end

end
