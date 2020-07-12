require_relative 'weather'
require_relative 'plane'

class Airport
    attr_reader :capacity

    DEFAULT_CAPACITY = 100

    def initialize(capacity=DEFAULT_CAPACITY, weather=Weather.new)
        @weather = weather.stormy?
        @capacity = capacity
        @planes = []
    end

    def weather
        @weather
    end

    def planes
        @planes
    end

    def full?
        planes.count >= @capacity
    end

    def land(plane=Plane.new)
        fail 'Weather conditions do not permit landing' if self.weather == true
        fail 'Plane is not flying' if plane.flying? == false
        fail 'Airport is at capacity' if self.full?
        planes << plane
    end

    def take_off(plane=Plane.new)
        
    end

end
