class Airport
    attr_reader :planes
    attr_reader :capacity
    def initialize(capacity = 1)
        @planes = []
        @capacity = capacity
    end

    def land(plane)
        raise "Plane already landed once" if @planes.include? plane
        raise "Cannot land when stormy" if get_weather == "stormy"
        raise "Airport full" if @planes.length == @capacity
        @planes << plane
    end

    def takeoff(plane)
        raise "Plane already took off" if !@planes.include? plane
        raise "Cannot take-off when stormy" if get_weather == "stormy"
        @planes.delete(plane)
    end

    def get_weather
        weather = rand(1..10)
        if weather >= 9
            "stormy"
        else
            "sunny"
        end
    end
end