class Airport
	DEFAULT_CAPACITY = 10
	
	attr_reader :planes, :capacity

	def initialize
		@planes = []
		@capacity = DEFAULT_CAPACITY
	end
end
