class Plane

	attr_reader :location

	def initialize
		@landed = false
		@location = :sky
	end

	def try_to_land(airport)
		landed? ? "Plane is already landed" : airport.receive(self)
	end

	def land(airport)
		@landed = true
		@location = airport
		"Plane landed successfully..."
	end

	def land_fails(reason)
		if reason == :full 
			"Plane failed to land because airport is already full"
		elsif reason == :weather
			"Plane failed to land because of bad weather"
		end	
	end

	def try_to_takeoff
		location == :sky ? "Plane is already in the sky" : location.dispatch(self)
	end

	def take_off
		@landed = false
		@location = :sky
		"Plane has successfully departed..."
	end

	def take_off_fails
		"Plane failed to take off because of bad weather"
	end

	def landed?
		@landed
	end

end