require_relative 'plane'
require_relative 'weather'

class Airport
    DEFAULT_CAPACITY = 2
    attr_reader :plane, :weather
    attr_accessor :capacity, :planes

    def initialize(capacity=DEFAULT_CAPACITY, weather = Weather.new)
        @planes = []
        @capacity = capacity
        @weather = weather
    end

    def planes_at_airport
        @planes
    end

    def land(plane)
        fail 'Airport full' if airport_full
        @planes.append(plane)
    end

    def take_off(plane)
        fail 'The weather is too stormy' if stormy_weather(weather) == true
            @planes.delete(plane)
            "Plane #{plane} has taken off."
    end

    def airport_full
        @planes.count >= capacity
    end

    def stormy_weather(weather)
        return true if weather.stormy?
    end
end