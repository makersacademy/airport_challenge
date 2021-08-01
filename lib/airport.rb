class Airport

    attr_reader :airport
    CAPACITY = 20

    def initialize
      @airport = []
    end

    def land_airplane
      raise "No available landing spots" if full?
      @airport.push('airplane')
    end

    def takeoff
      airport.pop
    end

    private

    def full?
        @airport.length >= CAPACITY ? true : false
    end
end