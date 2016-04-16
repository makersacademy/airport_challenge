class Airport

	attr_reader :landed

	def initialize(capacity=20)
		@landed = []
		@capacity = capacity
	end

	def receive(plane,weather)
		if weather.stormy?
			plane.land_fails("weather")
		elsif full?
			plane.land_fails("full")
		else
			@landed << plane
			plane.land(self)
		end
	end

	private

	def full?
		landed.length == @capacity
	end

end