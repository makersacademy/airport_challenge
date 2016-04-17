

class Weather


	def stormy?
		generate_weather == false
	end

	private

	OUTLOOKS = [false, false, false, false, false, true]

	def generate_weather
		OUTLOOKS.sample
	end

end