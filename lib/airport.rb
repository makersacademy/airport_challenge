require_relative 'plane'

class Airport

    DEFAULT_CAPACITY = 20
    attr_reader :plane, :capacity

    def initialize(capacity = DEFAULT_CAPACITY)
        @planes = []
        @capacity = capacity
    end
    # the land methods creates instances of planes
    # is an instance variable to store planes
    def landing(plane)
        fail 'airport is full' if full?
        fail 'cant land due to storm' if weather == "stormy"
        @planes << plane

    end
    # plane departs, one less plane in airport each time, unless weather is stormy
    def departing
        fail 'no planes at the airport' if empty?
        fail 'cant fly due to storm' if weather == "stormy"
        @planes.pop
    end

    def weather
        weather = ["sunny", "sunny", "stormy"]
        weather.sample
    end

    private
    def full?
        @planes.count >= capacity
    end

    def empty?
        @planes.empty?
    end

end