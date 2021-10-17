# require 'weather_reporter'

class Airport 
    #DEFAULT_CAPACITY = 20
    # attr_reader :planes
    def initialize( capacity )
        # def initialize(weather_reporter, capacity = DEFAULT_CAPACITY)
        # @weather_reporter = weather_reporter
        @capacity = capacity
        @planes = []
       
    end

    def land(plane)
        raise "Cannot land: Weather is stormy?" if stormy?
        raise "Airport full!" if full?
        @planes << plane
    end

    def take_off(plane)
        raise "Cannot take_off: Weather is stormy?" if stormy?
        # @planes.pop
        # plane
    end
   
    private 

    def full?
        @planes.length >= @capacity
    end

    def stormy?
        # @weather_reporter.stormy?
        rand(1..6) > 4
    end
end