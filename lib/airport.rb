require_relative 'plane'


class Airport

	attr_accessor :planes, :capacity

	DEFAULT_CAPACITY = 20

    def initialize(capacity = DEFAULT_CAPACITY)
		@planes = []
		@capacity = capacity
    end

    def allow_takeoff(weather)
      fail "No planes available for takeoff" if @planes.empty?
      fail "No takeoffs due to stormy weather" if weather.stormy?
       @planes.pop
    end

    def allow_landing(plane, weather)
		fail "Airport is full" if @planes.count >= capacity 
		fail "No landings due to stormy weather" if weather.stormy?
        @planes << plane
    end

    def full?
    	@planes.length >= 20
    end
end