class Airport

	def initialize(capacity)
		@capacity = capacity
		@planes = []

	end

	def land(plane)
		raise 'Airport full, cannot land plane' if full?
		raise 'Cannot land plane when weather is stormy' if stormy?
		@planes << plane


	end

	def take_off(plane)
		raise 'Cannot take off when weather is stormy' if stormy?
	end

	private

	def full?
		@planes.length >= @capacity
	end

	def stormy?
		rand(1..6) > 4
	end

end