class Airport
  DEFAULT_CAPACITY = 10
  attr_reader :planes, :capacity

	def initialize(capacity = DEFAULT_CAPACITY)
		@capacity = capacity
		@planes = []
	end

	def land(plane)
		raise 'Airport full' if full?
		@planes << plane
	end

	def take_off(plane)
		@planes.delete(plane)
	end

	def contains?(plane)
		@planes.include?(plane)
	end

	private

	def full?
		@planes.count >= capacity
	end

end