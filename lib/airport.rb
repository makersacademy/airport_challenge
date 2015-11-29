require_relative 'plane'

class Airport

def initialize
  @planes = []
end

attr_reader :planes

#MAX_CAPACITY = 40


def land(plane)
    @planes << plane
end

def take_off(plane)
  plane
end





end
