require './lib/plane'

class Airport
  attr_reader :plane
  DEFAULT_CAPACITY = 1

  attr_accessor :capacity

def initialize(capacity=DEFAULT_CAPACITY)
  @plane = []
  @capacity = capacity
end

def land(plane)
  fail 'Warning, airport full' if full?
  @plane << plane
end

def take_off
  @plane
end

private

def full?
  @plane.count >= capacity
end

def empty?
  @plane.empty?
end

end
