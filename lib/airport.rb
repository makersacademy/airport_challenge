class Airport

	def initialize(capacity)
		@capacity = capacity
		@planes = 0
	end

	def arrival
		@planes += 1
	end

	def full?
		@planes >= @capacity
	end
end