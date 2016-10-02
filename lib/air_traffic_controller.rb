require './lib/weather'

class AirTrafficController

	def responds_to_weather(weather)
			@weather = weather
			#=(Range.new(0,2))
			#good_weather = Range.new(3,10)	
	end 

	def prevent_take_off(weather)
		 @prevent = weather
	end 
end

=begin
weather = rand(10)

good_weather = Range.new(3,10)
bad_weather = Range.new(0,2)

if weather == good_weather
	true
else
	false
end 
=end