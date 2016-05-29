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

	def transition_ok?(new_position)
		raise_error if @weather.stormy? || !new_position.accept_plane?(self)
		raise_error if !new_position.is_airport?^landed?
		true
	end

	def change_position(new_position)
		transition_ok?(new_position) ? @position = new_position : raise_error
	end

	def raise_error
		raise "error"
	end
end