class Plane

	attr_reader :destination, :location, :pilot
	attr_writer :flying

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

		if airport.full?
			self.pilot.permission_to_land = false
			fail "Can't land, airport is full now!"
		end

		if airport.weather == "Stormy, like hell on earth"
			fail "Airport is too stormy to land now!"
		end

		@flying = false

		airport.receive_plane(self)

		@destination = nil
		@location = airport
		self.pilot.permission_to_land = false
		return self
	end

	def landed?
		!flying?
	end

	def take_off(destination)
		if self.pilot.permission_to_take_off == false
			fail "This plane's pilot does not have permission to take off"
		end

		if destination == self.location
			fail "This plane is currently located at the destination you have specified - enter a different destination" 
		end

		if self.location.weather == "Stormy, like hell on earth"
			fail "Cannot take off when the weather is stormy"
		end
		
		plane = self.location.planes.index(self)
		self.location.planes.slice!(plane)

		@destination = destination
		@flying = true
		@location = nil
		self.pilot.permission_to_take_off = false
	end

end
