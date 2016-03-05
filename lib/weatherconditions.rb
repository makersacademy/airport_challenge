module Weather_Conditions

	WEATHER = [:stormy]

	def weather
		@current_weather = WEATHER.sample
	end
end