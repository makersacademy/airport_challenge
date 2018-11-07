#Class Weather
class Weather
	def initialize
		@storm = false
	end
	def stormy?
		@storm = [true, false].sample
	end
end