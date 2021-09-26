class Weather 
	attr_accessor :condition

	 WEATHER_CONDITIONS = ["Stormy", "Sunny", "Raining", "Mild", "Windy"]

	 def stormy?
		 random_condition == "Stormy"
	 end

	 def random_condition
		WEATHER_CONDITIONS.sample
	 end
end
