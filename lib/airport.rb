class Airport

DEFAULT_VALUE = 5
attr_accessor :capacity

def initialize(capacity = DEFAULT_VALUE)
  @capacity = capacity
  @no_of_planes = 0
end

# lands planes
def land(plane)
  fail "The airport is full" if @capacity == @no_of_planes
  @no_of_planes += 1
end

# lets planes take off

def take_off(plane)
end

  # checks to see if there are planes in the airport
def empty?
  true
end
end
