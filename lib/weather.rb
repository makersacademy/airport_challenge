class Weather 
	
	def initialize
		# @airport_a = Airport.new

	end

	def stormy?
		random_outlooks == "stormy"
	end

	WEATHER_CONDITIONS=["Stormy", "Sunny", "Sunny", "Raining", "Light winds", "Mild", "Windy"]

	def random_outlooks(weather = WEATHER_CONDITIONS.sample)
		@weather = weather
	end
end