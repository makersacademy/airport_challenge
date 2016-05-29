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
l = Weather.new.stormy?
x = Weather.new.stormy?
puts b = x ? l : !l
puts x^!l == l^!x