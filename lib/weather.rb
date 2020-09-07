class Weather
	
	attr_reader :weather 

	WEATHER = [ :sunny, :rainy, :stormy, :breezy ]

	def stormy?
		WEATHER.sample == :stormy
	end 
end 