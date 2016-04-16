class Plane

	attr_reader :location, :weather

	def initialize(weather)
		@weather = weather
		@landed = false
	end

	def try_to_land(airport)
		airport.receive(self,weather) if landed? == false
	end

	def land(airport)
		@landed = true
		@location = airport
		"Plane landed successfully..."
	end

	def land_fails(reason)
		if reason == "full" 
			"Plane failed to land because airport is already full"
		elsif reason == "weather"
			"Plane failed to land because of bad weather"
		end	
	end

	def landed?
		@landed
	end

end