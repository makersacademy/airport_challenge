require 'plane'
require 'weather'

class Airport
    DEFAULT_CAPACITY = 30

    attr_accessor :airport, :capacity, :weather, :planes
    
    def initialize (capacity = DEFAULT_CAPACITY, weather = Weather.new)
        @airport = []
        @capacity = capacity
        @weather = weather
        @planes = planes
    end

    def takeoff
        raise 'Bad weather' if weather.bad?
        airport.pop
    end

    def land(plane)
        raise 'Airport is full' if full
        raise 'More Bad weather' if weather.bad?
        airport << plane
    end

    def full
        airport.length >= capacity
    end
end