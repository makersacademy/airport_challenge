require './lib/weather'

class AirTrafficController
	def responds_to_weather(weather)
			@reaction_to_weather = weather
	end 

	def prevent_take_off(weather)
		@prevent = weather

	end 
end

