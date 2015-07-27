class TrafficController
	attr_reader :location

	def initialize(airport)
		@location = airport
	end

	def generate_weather
		possibilities = ["Glorious sunshine", "Glorious sunshine", "Stormy, like hell on earth"]
		self.location.weather = possibilities.shuffle.first
	end

	def grant_permission_to_land?(pilot)
		weather = generate_weather

		if (pilot.plane.destination != self.location) || self.location.full? || self.location.weather == "Stormy, like hell on earth"
			return false
		else
			return true
		end
	end

	def grant_permission_to_take_off?(pilot)
		weather = generate_weather

		if pilot.plane.destination == self.location || self.location.weather == "Stormy, like hell on earth"
			return false
		else
			return true
		end
	end
end