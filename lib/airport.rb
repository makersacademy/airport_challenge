#require_relative 'plane'
class Airport

	attr_accessor :capacity

	DEFAULT_CAPACITY =10

	def initialize(capacity = DEFAULT_CAPACITY)
		@capacity =  capacity
		@planes = []
	end

	def land(plane)
		raise 'Airport is full' if full?
		raise 'Weather is stormy, cannot land' if stormy?
		plane.landed = true
	end

	def take_off(plane)
		raise 'Weather is stormy, cannot take off' if stormy?
		plane.landed = false
	end

	private 

	def stormy?
		 rand(1..100) > 50? true : false
	end	

	def full?
		@capacity == 0
	end

end