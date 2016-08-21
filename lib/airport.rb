require_relative 'plane'

class Airport

def initialize
  @weather = true
  @planes = []
  @sky = []
end

def stormy
  @weather = false
end

def take_off(plane)
  @sky << plane
end

def landing(plane)
  @planes << plane
end



end
