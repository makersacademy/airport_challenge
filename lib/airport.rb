require_relative 'plane'

class Airport

	DEFAULT_CAPACITY = 20

	attr_accessor :capacity
	
	def initialize capacity = DEFAULT_CAPACITY
		@planes = []
		@capacity = capacity
	end

	def take_off
		
		raise 'Your plane is not here' if empty?
		# raise 'the weather is stormy' if stormy?
		planes.pop
	end

	def landing plane
		
		raise 'Airport full' if full? 
		# raise 'the weather is stormy' if stormy?
		planes << plane
	end

	private

	attr_reader :planes

	def full?
		planes.count >= capacity
	end

	def empty?
		planes.empty?
	end

	def stormy?
		return true if Random.rand(5) == 1
	end
end