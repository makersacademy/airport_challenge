class Plane

	attr_reader :destination

	def initialize(destination = "nowhere!") 
		@flying = true
		@destination = destination
	end

	def flying?
		@flying
	end

	def land(airport)
		@flying = false
		return self
	end

	def landed?
		!flying?
	end

	def take_off
		@flying = true
	end

end
