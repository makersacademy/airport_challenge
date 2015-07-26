class TrafficController
	attr_reader :location

	def initialize(airport)
		@location = airport
	end

	def generate_weather
		possibilities = ["Glorious sunshine", "Glorious sunshine", "Stormy, like hell on earth"]
		possibilities.shuffle!
		self.location.weather = possibilities.first
	end

	def grant_permission_to_land?(pilot)
		weather = generate_weather

		if pilot.plane.destination != self.location || self.location.full?
			return false
		else
			return true
		end
	end

	def grant_permission_to_take_off?(pilot)
		if pilot.plane.destination == self.location
			return false
		else
			return true
		end
	end
end