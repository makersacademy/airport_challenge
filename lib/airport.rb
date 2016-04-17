require_relative "weather"
require_relative "plane"

class Airport
	
		def initialize(weather = Weather.new)
			@weather = weather
		end

		def land(plane)
	 		true
		end

	def depart(plane)
	 
	 	if self.weather.stormy?
	 		raise "Unable to take off due to stormy weather"
	 	else
	 		true
	 	end
	
	end


end