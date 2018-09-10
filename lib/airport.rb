require_relative "plane.rb"
require_relative "weather.rb"
class Airport
    attr_reader :planes, :capacity
    #@weather is writeable because the airport's weather can change
    attr_accessor :weather
    DEFAULT_CAPACITY = 100
    def initialize(capacity: DEFAULT_CAPACITY)
        @weather = Weather.condition
        @planes = []
        @capacity = capacity
    end
    def take_off(plane)
        raise "Error, plane #{plane.id} is not at this airport" if !airport_contains_plane?(plane)
        raise "Error, too stormy to take off" if stormy_weather?
        planes.delete(plane)
        "Plane #{plane.id} has taken off!"                    
    end
    def land_plane(plane)
        raise "Error, plane #{plane.id} is already at this Airport" if airport_contains_plane?(plane)
        raise "Error, too stormy to land plane #{plane.id}" if stormy_weather?
        raise "Error, Airport is full" if full_airport?
        planes << plane
        "Plane #{plane.id} has landed!"
    end

    private
        def airport_contains_plane?(plane)
            planes.include?(plane)
        end
        def stormy_weather?
            weather == :stormy
        end
        def full_airport?
            planes.count >= @capacity
        end
end