class Plane
	
	def initialize
		@flying = true
		@destination
	end

	def flying?
		@flying
		@destination = ['London', 'New York', 'Tokyo'].sample
	end

	def landed?
		@flying == false
	end

	def land
		@flying = false
	end

	def take_off
		@flying = true
	end

end
