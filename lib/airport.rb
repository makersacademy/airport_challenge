require_relative 'plane'
require_relative 'weather'

class Airport
    attr_reader :planes
    attr_accessor :capacity, :weather

    DEFAULT_CAPACITY = 20
    
    def initialize(capacity = DEFAULT_CAPACITY)
        @capacity = capacity
        @planes = []
        weather = Weather.new
        @weather = weather.good
    end

    def land(plane)
        fail 'Airport is full' if planes.count == capacity
        fail 'Bad weather no landing' if @weather == false
        @planes << plane
    end

    def take_off(plane)
        fail 'Bad weather no take off' if @weather == false
        @planes.pop
    end

end