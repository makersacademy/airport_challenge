class Weather

	CONDITIONS = [:stormy, :clear, :clear, :clear]

	def random_weather
		CONDITIONS.sample
	end

	def stormy?
		random_weather == :stormy
	end

end
