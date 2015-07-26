require_relative 'plane'
require_relative 'weather'

class Airport
	include Weather

	DEFAULT_CAPACITY = 150

	attr_accessor :capacity 

	def initialize ( capacity = DEFAULT_CAPACITY )
		@planes = []
		@capacity = capacity
	end 

	def release plane
		raise 'Cannot take off while weather is stormy' if stormy? == true
		raise 'plane is already flying' if plane.flying? == true
		@planes.pop
		plane.take_off
	end 

	def receive plane
		raise 'Cannot land while weather is stormy' if stormy? == true
		raise 'Airport is full' if full?
		raise 'plane has already landed' if plane.flying? == false
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
