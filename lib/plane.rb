require_relative 'airport'

class Plane

	def initialize
		@flying = true 
		return "Plane is flying"
	end 

	def flying?
		return @flying 
	end 

	def land
		@flying = false 
		return "Plane is stationary"
	end 

	def take_off
		@flying = true 
		return "Plane is flying"
	end 

end 