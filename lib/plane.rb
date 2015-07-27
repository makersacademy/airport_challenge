class Plane
	
	attr_reader :destination

	def initialize (destination)
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
		fail 'Plane has already landed' if landed?
		@flying = false
	end

	def take_off
		@flying = true
	end

	# def destination
	# 	['London', 'New York'].sample
	# end

end
