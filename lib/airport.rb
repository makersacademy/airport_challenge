require_relative "plane.rb"
class Airport
    attr_reader :weather, :planes, :capacity
    DEFAULT_CAPACITY = 100
    def initialize(weather = :clear, capacity = DEFAULT_CAPACITY)
        @weather = weather.to_sym
        @planes = []
        @capacity = capacity
    end
    def change_weather(weather)
        @weather = weather.to_sym
    end
    def take_off(plane)
        raise "Error, too stormy to take off" if stormy_weather?
        @planes.delete(plane)
        "Plane #{plane.id} has taken off!"                    
    end
    def land_plane(plane)
        raise "Error, too stormy to land plane #{plane.id}" if stormy_weather?
        raise "Error, Airport is full" if full_airport?
        @planes << plane
        "Plane #{plane.id} has landed!"
    end

    private
        def stormy_weather?
            @weather == :stormy
        end
        def full_airport?
            @planes.count >= @capacity
        end
end