require_relative 'plane'
require_relative 'weather'

class Airport

    DEFAULT_CAPACITY=10

    attr_reader :capacity

    def initialize(capacity=DEFAULT_CAPACITY)
      @planes = []
      @capacity = capacity
    end

    def land(plane)
      fail "That plane has already landed." if is_landed?(plane)
      fail "Airport is full! Plane cannot land." if is_full?
      fail "It's too stormy to land." if is_stormy?
      plane.make_landed
      @planes << plane
    end

    def takeoff(plane)
      fail "That plane is not currently in this airport." unless in_this_airport?(plane)
      fail "That plane has already taken-off." unless is_landed?(plane)
      fail "It's too stormy to take-off." if is_stormy?
      plane.took_off
      @planes.delete(plane) if in_this_airport?(plane)
    end

  private

    attr_reader :planes

    def in_this_airport?(plane)
      @planes.include? plane
    end

    def is_stormy?
      Weather.new.stormy?
    end

    def is_full?
      @planes.length == @capacity
    end

    def is_landed?(plane)
      plane.landed?
    end

end
