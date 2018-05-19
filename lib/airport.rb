class Airport
	 DEFAULT_CAPACITY = 100
	 attr_reader :capacity, :planes

	 def initialize(capacity = DEFAULT_CAPACITY)
		  @capacity = capacity
		  @planes = []
	 end
	 
	 def land plane
		fail 'Airport is full!' if full?
		fail "It's too stormy to land!" if stormy?
		@planes << plane
	 end

	 def depart plane
		fail "That plane isn't here!" unless @planes.include?(plane) 
		@planes.delete(plane)
	 end

	private

	def full?
		@planes.count >= capacity
	end

	def stormy?
	end

end
