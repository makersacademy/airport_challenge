#require_relative 'plane'

class Airport

DEFAULT_CAPACITY = 0
	def initiliaze(capacity =DEFAULT_CAPACITY)
	@capacity =  capacity
	@planes = 0
	end

	def land(plane)
		raise 'Airport is full' if full?
		raise 'Weather is stormy, cannot land' if stormy?
		plane.landed?
		#@planes += 1
	end

	def take_off(plane)
		raise 'Weather is stormy, cannot take off' if stormy?
		plane.landed = false
		@planes -= 2
	end

	private 

	def stormy?
		 rand(1..100) > 50? true : false
	end	

	def full?
		@capacity == 0
	end

	


end