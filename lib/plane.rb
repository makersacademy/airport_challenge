require "weather"

class Plane
	SKY = Sky.new
	NO_WEATHER = NoWeather.new

	def initialize
		@position =  SKY
		@weather = NO_WEATHER
	end

	def land(airport)
		change_position(airport)
	end

	def take_off
		change_position(SKY)
	end	

	def transition_ok?(new_position)
			new_position.accept_plane?(self) && !new_position.is_airport? ? landed? : !landed?
	end

	def change_position(new_position)
		if transition_ok?(new_position) && !@weather.stormy?
			@position = new_position 
		else
			raise "error"
		end
	end

	def landed?
		@position.is_airport?
	end

	def get_position
		@position
	end

	def weather(weather)
		@weather = weather
	end

	private
end
