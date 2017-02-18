require_relative 'plane'

class Airport

DEFAULT_CAPACITY = 20

attr_reader :capacity

def initialize(capacity = DEFAULT_CAPACITY)
  @capacity = capacity
  @planes =[]
end

def stormy?
  false
end

def full?
  if @planes.count >= capacity
    true
  else
    false
  end
end

def land(plane)
  fail 'Cannot land plane because of stormy weather or at full capacity' if self.stormy? || self.full?
  @planes << plane
  plane.landed
end

def take_off(plane)
  fail 'Cannot let plane take off because of stormy weather' if self.stormy?
  plane.taken_off
end

end
