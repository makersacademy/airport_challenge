require './lib/plane'

class Airport


	DEFAULT_CAPACITY = 50

	attr_reader :planes, :DEFAULT_CAPACITY

	def initialize(capacity = DEFAULT_CAPACITY)
		@capacity = capacity
		@planes = []
	end

	def land(plane)
		@planes << plane
	end


	def take_off(plane)
		@planes.pop
	end

	def full?

		@planes.length >= capacity
	
	end


end
