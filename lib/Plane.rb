class Plane

	def initialize
		@fly = true
	end
	
	def flying
		@fly
	end

	def takes_off
		@fly = true 
	end 

	def land
		@fly = false  
	end 
end 
