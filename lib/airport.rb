class Airport

	DEFAULT_CAPACITY = 10

	def initialize
		@planes = []
		@capacity = DEFAULT_CAPACITY
	end

	def is_stormy?
		rand(0..1) == 0 ? true : false
	end

	def is_full?
		@planes.length >= @capacity ? true : false 
	end

end

