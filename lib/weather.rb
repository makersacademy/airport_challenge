#Class Weather
class Weather
	def initialize
		@storm = false
	end
	def stormy?(status = true)
		@storm = status
	end
end