require_relative 'plane'

class Airport
	DEFAULT_CAPACITY = 150
	attr_accessor :capacity 

	def initialize (capacity = DEFAULT_CAPACITY)
		@planes = []
		@capacity = capacity
	end 

	def release plane
		@planes.pop
		plane.take_off
	end 

	def receive plane
		raise 'Airport is full' if full?
		plane.land
		@planes << plane
	end 

	private

	def empty?
		@planes.size == 0
	end 

	def full?
		@planes.size >= @capacity
	end 

end
