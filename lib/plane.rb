class Plane
	attr_accessor :current_airport

	def initialize
		@current_airport
	end

	def land(airport)
		if airport.weather == "stormy"
			"Stormy weather. Unable to land."
		else
			@current_airport = airport
			airport.landed_planes << self
		end	
	end

	def take_off
		if @current_airport.weather == "stormy"
			"Stormy weather. Unable to take off."
		else
			@current_airport.landed_planes.delete(self)
			@current_airport = nil
		end
	end
end