class Airport
    attr_reader :DEFAULT_CAPACITY, :planes
    DEFAULT_CAPACITY = 30

    def initialize(capacity = DEFAULT_CAPACITY)
        @capacity = capacity
        @planes = []
    end
    
    def prevent_landing_capacity(plane)
        raise "airport is full" if @planes.count > @capacity 
        @planes << plane
    end

    def prevent_landing_weather(plane)
        raise "it is stormy" if stormy?
        @planes << plane
    end

    def stormy?
        weather = rand(0..20) 
        return weather < 5
    end

end

# airport = Airport.new
# airport.prevent_landing_weather(10)


