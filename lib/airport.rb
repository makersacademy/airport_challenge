class Airport 
	
	DEFAULT = 10
	attr_reader :aircrafts, :capacity

	def initialize(capacity = DEFAULT)

		@aircrafts = []
		@capacity = capacity
		
	end

	def land
		fail "airport is full" if full?
		@aircrafts << 1
	end

	def take_off
		@aircrafts.pop
	end

	def full?
		@aircrafts.count == @capacity
	end

end