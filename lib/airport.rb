class Airport
    attr_accessor :capacity
    attr_reader :planes_at_airport

    DEFAULT_CAPACITY=100

    def initialize(capacity = DEFAULT_CAPACITY)
        @capacity = capacity
        @planes_at_airport = []
    end

    def full?
        @planes_at_airport.length == @capacity
    end

    #planes land at airport and get added to the list of planes at the airport
    def airport_dock(plane)
        fail 'airport is full' if full?
        @planes_at_airport << plane
        @plane = plane

    end

    def plane_takeoff_confirmation
        @planes_at_airport.pop 
        p "WE OUTTA HERE!!"
    end

end