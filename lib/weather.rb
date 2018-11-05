class Weather
		# Righthand operand of modulus can be adjusted to set
		# frequency chance of stormy weather.
		# Generates random weather by default, can be
		# 'gamed' if provided with argument.
	def generate_weather (seed = rand(1..3))
		seed % 3 == 0 ? "stormy" : "sunny"
	end
end