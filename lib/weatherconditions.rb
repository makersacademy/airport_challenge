module WeatherConditions

	WEATHER = [:stormy,:rainy,:windy,:sunny]

	def weather
		@current_weather = WEATHER.sample
	end
end