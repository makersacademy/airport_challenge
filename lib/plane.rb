class Plane

	attr_reader :location

	def initialize
		@landed = false
	end

	def try_to_land(airport)
		airport.receive(self) if landed? == false
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