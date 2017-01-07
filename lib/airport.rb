require_relative 'plane'

class Airport

	#DEFAULT_CAPACITY = 0 
	#def initiliaze(capacity = DEFAULT_CAPACITY)
	#@capacity =  capacity
	#end  
	def land(plane)
		raise 'Weather is stormy, cannot land' if bad_weather?
		plane.landed?
	end

	def take_off(plane)
		raise 'Weather is stormy, cannot take off' if bad_weather?
		plane.landed = false
	end

private
	def bad_weather?
		"sunny" if rand(1..100) > 50
		"stormy"
	end	

end