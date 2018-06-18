class Airport

attr_reader :capacity
attr_reader :planes

DEFAULT_CAPACITY = 20

def initialize(capacity = DEFAULT_CAPACITY)
  @capacity = capacity
  @planes = []
end

def land(plane)
  fail "Runway full" if @planes.count >= @capacity
  @planes << plane

end

def take_off(plane)
  @planes.pop
end






end