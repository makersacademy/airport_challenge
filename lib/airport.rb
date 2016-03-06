class Airport

	def initialize(capacity)
		@capacity = capacity
		@planes = []

	end

	def land(plane)
		raise 'Airport full, cannot land plane' if @planes.length >= @capacity
		@planes << plane
	end

	def take_off(plane)

	end

end