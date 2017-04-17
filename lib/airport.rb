require_relative 'plane'

class Airport

	DEFAULT_CAPACITY = 5

	def initialize(capacity = DEFAULT_CAPACITY)
		@capacity = capacity
		@planes = []
	end

	def land(plane)
		fail 'Airport is full' if full?
		# plane.land?
		planes << plane
	end

	def take_off(plane)
		plane.take_off?
		planes.pop
	end

	private

	def full?
		planes.length >= capacity
	end

	attr_accessor :planes, :capacity

end