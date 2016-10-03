require_relative 'plane'

class Airport


	DEFAULT_CAPACITY = 50

	attr_reader :planes, :capacity

	def initialize(capacity = DEFAULT_CAPACITY)
		@capacity = capacity
		@planes = []
	end

	def land(plane)
		@planes << plane
		puts "Landed"
	end


	def take_off(plane)
		@planes.pop
	end

	def full?

		@planes.length >= capacity

	end


end
