class TrafficController
	attr_reader :location

	def initialize(airport)
		@location = airport
	end

	def grant_permission?(pilot)
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