class Airport

    attr_reader :airport, :capacity, :weather
    CAPACITY = 20

    def initialize(capacity = CAPACITY)
      @capacity = capacity
      @airport = []
    end

    def land_airplane
      raise "No available landing spots" if full?
      todays_weather
      @airport.push('airplane')
    end

    def takeoff
        todays_weather
        airport.pop
    end

    def todays_weather
        weather = rand(1..6)
        puts weather
        weather == 3 ? (raise "Cannot access runway due to storms") : false
    end

    private

    def full?
        @airport.length >= CAPACITY ? true : false
    end

end