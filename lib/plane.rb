class Plane

	attr_reader :destination
	attr_reader :location

	def initialize(destination = "nowhere!") 
		@flying = true
		@destination = destination
		@location = nil
	end

	def flying?
		@flying
	end

	def land(airport)
		fail "That plane isn't headed for here!" if airport != self.destination
		@flying = false
		@destination = nil
		@location = airport
		return self
	end

	def landed?
		!flying?
	end

	def take_off(destination)
		fail "This plane is currently located at the destination you have specified - enter a different destination" if destination == self.location

		@destination = destination
		@flying = true
		@location = nil
	end

end
