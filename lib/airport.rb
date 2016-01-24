require 'plane'

class Airport

	attr_reader :plane 

	def initialize
		@planes = []
	end

	def land(plane)
		@planes << plane 
		# 'the plane has landed'
	end

	def takeoff
		@planes.pop
	end

end

