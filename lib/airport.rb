require_relative 'plane'
class Airport
    attr_reader :planes
    def initialize
        @planes = []
    end
    def land(plane)
        @planes.push(plane)
        @planes[@planes.length - 1]
    end

    def take_off
       @planes.pop()
    end
end