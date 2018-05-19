class Airport

	attr_reader :capacity

	DEFAULT_CAPACITY = 20

	def initialize(capacity = DEFAULT_CAPACITY)
		@capacity = capacity
	end

	def maximum_capacity?
	end

	def takeoff?
	end

	def stormy?
	end

end
