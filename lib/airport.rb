require_relative 'plane'
require_relative 'weather'

class Airport
    attr_reader :planes
    attr_accessor :capacity, :weather

    DEFAULT_CAPACITY = 20
    
    def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
        @capacity = capacity
        @planes = []
        @weather = weather
    end

    def land(plane)
        fail 'Airport is full' if planes.count == capacity
        fail 'Bad weather no landing' unless weather.good?
        @planes << plane
    end

    def take_off(plane)
        fail 'Bad weather no take off' unless @weather.good?
        @planes.pop
    end

    def check(plane)


    end

end