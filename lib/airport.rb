require_relative 'plane'
require_relative 'weather'
class Airport
    DEFAULT_CAPACITY = 40
attr_accessor :airplanes, :capacity, :weather
    def initialize
       @airplanes = airplanes
        @airplanes = []
    end

    def takeoff

    end

    def land(plane)
        @airplanes << plane

    end


end