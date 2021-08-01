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
        raise "There are no available planes" if empty?
        todays_weather
        airport.pop
    end

    private

    def full?
        @airport.length >= CAPACITY ? true : false
    end

    def todays_weather
        weather = rand(1..6)
        weather == 3 ? (raise "Cannot access runway due to storms") : false
    end

    def empty?
        @airport.length == 0 ? true :false
    end

end