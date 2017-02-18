require_relative 'plane'

class Airport

def land(plane)
  fail 'Cannot land, airport full' if @plane
  @plane = plane
end

def take_off
  @plane
end

end
