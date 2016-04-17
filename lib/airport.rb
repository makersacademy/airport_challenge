require_relative "weather"
require_relative "plane"

class Airport

	attr_reader :weather
	
		def initialize(weather = Weather.new)
			@weather = weather
		end

		def land(plane)
			if self.weather.stormy?
	 			raise "Unable to land due to stormy weather"
	 		else
	 		true
	 		end

		end

		def depart(plane)
	 
	 		if self.weather.stormy?
	 			raise "Unable to take off due to stormy weather"
	 		else
	 			true
	 		end
	
		end


end