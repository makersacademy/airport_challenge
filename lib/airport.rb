
class Airport

attr_reader :stored_planes, :capacity

DEFAULT_CAPACITY = 20

def initialize(capacity=DEFAULT_CAPACITY)
  @stored_planes = []
  @capacity = capacity
end

def full?
  stored_planes.count >= capacity
end

end
