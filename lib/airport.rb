#require_relative 'plane'

class Airport

DEFAULT_CAPACITY = 0 
	def initiliaze(capacity = DEFAULT_CAPACITY)
	@capacity =  capacity
	end

	def land(plane)
		raise 'Weather is stormy, cannot land' if stormy?
		plane.landed?
	end

	def take_off(plane)
		raise 'Weather is stormy, cannot take off' if stormy?
		plane.landed = false
	end

	def stormy?
		true if rand(1..100) > 50
	end	

end