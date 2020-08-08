require_relative 'plane'
class Airport
    attr_reader :planes
    def initialize
        @planes = []
    end
    def land(plane)
        fail 'airport is full' if full?
        @planes.push(plane)
        @planes[@planes.length - 1]
    end

    def take_off
       @planes.pop()
    end

    private
    def full?
        if @planes.count >= 20
            true
        end
    end
end