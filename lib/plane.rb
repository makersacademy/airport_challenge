class Plane

	attr_reader :destination, :location, :pilot

	def initialize(destination = "nowhere!") 
		@flying = true
		@destination = destination
		@location = nil
		@pilot = Pilot.new(self)
	end

	def flying?
		@flying
	end

	def land(airport)
		if self.pilot.permission_to_land == false
			fail "Pilot does not have permission to land this plane"
		end

		@flying = false

		airport.receive_plane(self)

		@destination = nil
		@location = airport
		return self
	end

	def landed?
		!flying?
	end

	def take_off(destination)
		if destination == self.location
			fail "This plane is currently located at the destination you have specified - enter a different destination" 
		end
			
		@destination = destination
		@flying = true
		@location = nil
	end

end
