class Airport

	attr_reader :capacity, :planes

	DEFAULT_CAPACITY = 2

	def initialize(capacity = DEFAULT_CAPACITY)
		@planes = []
		@capacity = capacity
	end

	def land(plane)
		fail "#{plane} cannot land as the airport is full." if full?

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

		def full?
			
		end

end