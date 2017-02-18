require_relative 'plane'

class Airport

def stormy?
  false
end

def land(plane)
  fail 'Cannot land plane because of stormy weather' if self.stormy?
  plane.landed
end

def take_off(plane)
  fail 'Cannot let plane take off because of stormy weather' if self.stormy?
  plane.taken_off
end

end
