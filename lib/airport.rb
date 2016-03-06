require_relative 'plane'
require_relative 'weather'

class Airport

    def initialize
      @planes = []
    end

    def list_planes
      planes
    end

    def land(plane)
      fail "It's too stormy to land." if is_stormy?
      plane.is_landed
      @planes << plane
    end

    def takeoff(plane)
      fail "It's too stormy to take-off." if is_stormy?
      plane.took_off
      @planes.delete(plane)
    end

  private

    attr_reader :planes

    def is_stormy?
      Weather.new.stormy?
    end

end
