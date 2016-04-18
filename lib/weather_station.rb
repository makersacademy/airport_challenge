class WeatherStation
	def poor_weather?
		poor_weather = weather_generator
	end

	def weather_generator
		 random <= 50
	end

	def random
		rand(100)
	end
end