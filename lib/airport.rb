class Airport
DEFAULT_CAPACITY = 20
attr_reader :capacity
attr_accessor :planes

def initialize(capacity = DEFAULT_CAPACITY)
  @planes = []
  @capacity = capacity
end

def full?
  planes.count == capacity ? true : false
end

end
