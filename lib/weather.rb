
class Weather
	def initialize
		@weather = ['sunny', 'sunny', 'sunny', 'sunny', 'stormy']
	end

	def weather?
		set_weather
	end

	private
	def set_weather
		@weather.shuffle.pop
	end
end
