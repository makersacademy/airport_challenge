class Weather
	def stormy?
		rand(1..2) == 1 ? true : false
	end
end

class NoWeather
	def stormy?
		false
	end
end