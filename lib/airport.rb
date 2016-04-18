class Airport

	attr_reader :landed, :weather

	def initialize(capacity=10,weather=Weather.new)
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
			plane.take_off_fails
		else
			landed.delete(plane)
			plane.take_off
		end
	end

	private

	def full?
		landed.length == @capacity
	end

end