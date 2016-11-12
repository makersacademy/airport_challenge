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
		if check_weather == "sunny"
			plane_index = @planes.index(plane)
			@planes.slice!(plane_index)
			"#{plane} has left the airport."
		else
			fail "#{plane} cannot take off due to stormy weather."
		end
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