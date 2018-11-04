#Class Weather
class Weather
	def stormy?
		true
	end
end

# Class to know the status of the aircraft
class Status < Weather
	def land
		@@land = true
	end

	def take_off
		@@take_of = true
	end
end