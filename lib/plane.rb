class Plane
	
	def initialize
		@flying = true
		@destination = destination
	end

	def flying?
		@flying
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

	def destination
		['London', 'New York'].sample
	end

end
