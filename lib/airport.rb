require 'plane'

class Airport

    def initialize
        @planes = []
    end

    def land(plane)
        @planes << plane
    end

    def take_off(plane)
        @planes.pop
    end

end