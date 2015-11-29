
class Airport

attr_reader :stored_planes

DEFAULT_CAPACITY = 20

def initialize
  @stored_planes = []
end

def full?
  stored_planes.count >= DEFAULT_CAPACITY
end

end
