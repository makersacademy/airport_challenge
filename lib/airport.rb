require_relative 'plane'

class Airport

DEFAULT_CAPACITY = 20

attr_accessor :capacity

def initialize(capacity = DEFAULT_CAPACITY)
  @weather =  Random.rand(1..100)
  @planes = []
  @capacity = capacity
end

def confirm_landing(plane)
  @planes << plane
end

def confirm_takeoff(plane)
  @planes.pop if @weather > 20
end


end
