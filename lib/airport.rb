require_relative 'plane'

class Airport

	attr_accessor :planes, :capacity

	DEFAULT_CAPACITY = 20

    def initialize(capacity = DEFAULT_CAPACITY)
		@planes = []
		@capacity = capacity
    end

    def allow_takeoff
      fail "No planes available for takeoff" if @planes.empty?
      @planes.pop
    end

    def allow_landing(plane)
		 fail "Airport is full" if @planes.count >=20   
        @planes << plane
    end

    def full?
    	@planes.length >= 20
    end
end