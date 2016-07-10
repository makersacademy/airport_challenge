
class Weather
	def initialize
		@weather = ['sunny','rainy','windy','stormy']
	end

	def weather?
		set_weather
	end	

	private
	def set_weather
		@weather.shuffle.pop
	end
end