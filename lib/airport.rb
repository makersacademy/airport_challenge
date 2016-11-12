class Airport

	attr_reader :planes

	def initialize
		@planes = []
	end

	def land(plane)
		if check_weather == "sunny"
			@planes << plane
			"#{plane} has landed."
		else
			fail "#{plane} cannot land due to stormy weather."
		end
	end

	def take_off(plane)
		plane_index = @planes.index(plane)
		@planes.slice!(plane_index)
		"#{plane} has left the airport."
	end

	private

		def check_weather
			random_number = rand(5)
			if random_number == 0
				"stormy"
			else
				"sunny"
			end
		end

end