class Airport

    attr_reader :airport, :capacity
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
      airport.pop
    end

    private

    def full?
        @airport.length >= CAPACITY ? true : false
    end
end