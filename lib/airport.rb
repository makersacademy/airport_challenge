class Airport

	attr_reader :landed, :weather

	def initialize(capacity=10,weather)
		@landed = []
		@capacity = capacity
		@weather = weather
	end

	def receive(plane)
		if weather.stormy?
			plane.land_fails("weather")
		elsif full?
			plane.land_fails("full")
		else
			@landed << plane
			plane.land(self)
		end
	end

	def dispatch(plane)
		if weather.stormy?
			plane
		else
			plane.take_off
			landed.delete(plane)
		end
	end

	private

	def full?
		landed.length == @capacity
	end

end