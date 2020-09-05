class Weather
attr_reader :weather 

WEATHER = ["sunny", "rainy", "stormy", "breezy"]


	def weather
		weather == WEATHER.sample
	end 

	def stormy?
		weather == "stormy"
	end 

end 