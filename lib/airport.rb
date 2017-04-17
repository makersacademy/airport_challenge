require_relative 'plane'

class Airport

def initialize
  @planes = []
end

def confirm_landing(plane)
  @planes << plane
end

def confirm_takeoff(plane)
  @planes.pop
end



end
