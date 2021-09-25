require_relative 'plane'

class Airport

    attr_reader :planes 

    def initialize(planes = [])
        @planes = planes
    end

    def land(plane)
        @planes << plane
    end

    def take_off(plane)
        @planes.delete(plane)
    end
end 


