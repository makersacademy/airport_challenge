require "weather"

class Airport
    def initialize(capacity = capacity, weather_reporter)
       @capacity = capacity
       @weather_reporter = weather_reporter
       @number_of_planes_landed = []
    end
    def land(plane)
        fail 'this airport is full' if full?
        raise 'stormy weather, cannot land' if stormy?
        @number_of_planes_landed << plane
    end

    def take_off(plane)
      fail 'stormy weather, cannot take off' if stormy?
    end

    private

    def full?
        @number_of_planes_landed.length >= @capacity
    end
    def stormy?
        weather_reporter.new.stormy?
    end
end