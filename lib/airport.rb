class Airport

    attr_reader :airport, :capacity, :weather
    CAPACITY = 20

    def initialize(capacity = CAPACITY)
      @capacity = capacity
      @airport = []
    end

    def land_airplane
      raise "No available landing spots" if full?
      @airport.push('airplane')
    end

    def takeoff
        raise "Cannot takeoff, too stormy" if todays_weather == "stormy"
        airport.pop
    end

    def todays_weather
        weather = rand(1..6)
        weather == 3 ? "stormy" : "sunny"
    end

    private

    def full?
        @airport.length >= CAPACITY ? true : false
    end

end