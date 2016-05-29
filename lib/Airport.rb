class Airport

attr_reader :planes

	def initialize
		@planes = []
	end 


	def land(plane)
		@planes << plane 
		"The plane has just landed"
	end 

	def takeoff(plane)
		@planes.pop
		"The plane has now just departed"
	end 

end 