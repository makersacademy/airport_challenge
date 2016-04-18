require_relative "weather"
require_relative "plane"

class Airport

	attr_reader :weather, :capacity, :planes_in_airport

	DEFAULT_CAPACITY = 20
	
	
		def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
			@planes_in_airport = []
			@weather = weather
			@capacity = DEFAULT_CAPACITY
		end

		def land(plane)
	 			fail "Unable to land due to stormy weather" if self.weather.stormy?
	 			fail "Unable to land due airport in full capacity" if full?
	 			fail "Plane already in the airport" if self.landed?(plane)
	 			planes_in_airport << plane
	 	end

	 	def landed?(plane)
	 			self.planes_in_airport.include?(plane)
	 	end

		def depart(plane)
	 			fail "Unable to take off due to stormy weather" if self.weather.stormy?
	 			fail "Plane not in the airport" if self.landed?(plane) == false
	 			planes_in_airport.delete(plane).depart
	 	end

	 	def departed?(plane)
	 			self.landed?(plane) == false
	 	end

private

	 def full?
	 	planes_in_airport.count >= capacity
	 end
end