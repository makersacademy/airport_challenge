class Airport

	attr_reader :planes, :capacity

	DEFAULT_CAPACITY = 10

	def initialize
		@capacity = DEFAULT_CAPACITY
		@planes = []
	end
	
	def dock(plane)
		raise "Airport is full" if full?
		planes << plane
	end

	def full?
		@planes.count == capacity
	end

	def release plane
		@planes.delete plane
	end

	def planes
		@planes
	end

	def sunny?
		rand(21..100)
	end

	def stormy?
		rand(1..20)
	end
end
