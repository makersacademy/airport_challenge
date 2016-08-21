require_relative 'plane'

class Airport

def initialize
  @weather = true
  @ground = []
  @sky = []
  @capacity = 20
end

def stormy
  @weather = false
end

def take_off(plane)
  @sky << plane
end

def landing(plane)
  @ground << plane
end



end
