class Airport
	DEFAULT_CAPACITY = 10

	attr_reader :capacity, :planes

	def initialize(capacity = DEFAULT_CAPACITY)
		@capacity = capacity
		@planes = []
	end

	def land (plane)
		fail 'Airport is full' if full?
		@planes << plane
	end

	def take_off (plane)
		@planes.delete plane
	end


	private

		def full?
    		@planes.length >= @capacity
    	end
end