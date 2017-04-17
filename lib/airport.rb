require_relative 'plane'
require_relative 'weather'

class Airport
w = Weather.new
DEFAULT_CAPACITY = 20

attr_accessor :capacity

def initialize(capacity = DEFAULT_CAPACITY)
  @planes = []
  @capacity = capacity
end

def confirm_landing(plane)
  @planes << plane unless w.stormy?
end

def confirm_takeoff(plane)
  @planes.pop unless w.stormy?
end


end
