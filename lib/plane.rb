class Plane
	def initialize
		@landed = false
	end

	def land(airport)
		fail "This plane is already on the ground, Captain!" if landed?
		airport.accept(self)
		@landed = true
		"All passengers please fasten your seatbelts - we will be landing shortly."
	end

	def takeoff(airport)
		fail "We've already taken off, Sir! Are you feeling alright?" unless landed?
		airport.confirm_takeoff(self)
		@landed = false
		"Please fasten your seatbelts, fold your tray tables and prepare for lift off!"
	end

	def landed?
		@landed
	end
end