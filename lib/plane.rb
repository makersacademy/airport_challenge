class Plane

	attr_reader :location

	def try_to_land(airport)
		airport.receive(self)
	end

	def land(airport)
		@landed = true
		@location = airport
		"Plane landed successfully..."
	end

	def landed?
		@landed
	end

end