require 'plane'

class Airport
  DEFAULT_CAPACITY = 30
  attr_reader :capacity

def initialize
  @planes = []
end

    def land(plane)
      plane
      @planes << plane
      self
      raise "Airport full" if airport.full?
    end

    def take_off(plane)
      @planes.delete(plane)
    end

    def planes
      @planes
    end

    def full?
    @planes.count >= DEFAULT_CAPACITY
    end

end
