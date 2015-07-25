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
		fail "That plane isn't headed for here!" if airport != self.destination
		@flying = false
		@destination = nil
		return self
	end

	def landed?
		!flying?
	end

	def take_off(destination)
		@destination = destination
		@flying = true
	end

end
