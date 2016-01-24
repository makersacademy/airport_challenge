class Plane

	def initialize(name = "Airbus")
		@name = name
		@fly = true
	end
	
	def flying
		@fly
	end

	def takes_off
		@fly 
	end 

	def land
		@fly = false  
	end 
end 
