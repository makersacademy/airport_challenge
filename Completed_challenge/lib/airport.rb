require_relative 'weather'
require_relative 'plane'

class Airport
DEFAULT_CAPACITY = 50


def initialize(capacity = DEFAULT_CAPACITY)
  @capacity = capacity
  @planes = []
  @weather = Weather.new
end

def land(plane)

end

def leave(plane)

end

end
