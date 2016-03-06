require_relative 'plane'

class Airport

    def initialize
      @planes = []
    end

    def list_planes
      planes
    end

    def land(plane)
      plane.is_landed
      @planes << plane
    end

    def takeoff(plane)
      @planes.pop
    end

  private

    attr_reader :planes


end
