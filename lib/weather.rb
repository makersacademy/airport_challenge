class Weather
	def generate_weather
		# Righthand operand of modulus can be adjusted to set
		# frequency chance of stormy weather.
		(rand(1..10) % 3 == 0) ? "stormy" : "sunny"
	end
end