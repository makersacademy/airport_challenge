require_relative 'airport'

class Plane

	def initialize
		@flying = true 
		"Plane is flying"
	end 

	def flying?
		@flying 
	end 

	def land
		@flying = false 
		"Plane is stationary"
	end 

	def take_off
		@flying = true 
		"Plane is flying"
	end 

end 