require './lib/weather'

class AirTrafficController

	def responds_to_weather(weather)
			@weather = weather
	end 

	def prevent_take_off(weather)
		 if @weather == @bad_weather
		 	"Cancelled due to weather"
		 end 
	end
	
	def prevent_landing(weather)
		if @weather == @bad_weather
			"You are not permitted to land"
	 end 
  end 
end
