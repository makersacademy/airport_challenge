require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 50
  attr_writer :planes, :capacity
  plane = Plane.new

    def initialize(capacity = DEFAULT_CAPACITY)
      @capacity = capacity
      @planes = []
    end

    def land(plane)
      @planes << plane
    end

    def take_off(plane)
    #plane.take_off
    @planes.pop
    end

    def full?
      @planes.length >= capacity
    end

end
