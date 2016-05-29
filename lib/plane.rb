require "weather"

class Plane
	SKY = Sky.new
	NO_WEATHER = NoWeather.new

	attr_reader :position

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

	def weather(weather)
		@weather = weather
	end

	private

	def change_position(new_position)
		check_change(new_position)
		@position = new_position
		new_position.receive_plane(self)
	end

	def check_change(new_position)
		raise "Action does not make sense!" if transition_makes_sense?(new_position)
		raise "Stormy Weather" if @weather.stormy? 
	end

	def transition_makes_sense?(new_position)
		!new_position.is_airport?^landed? || !new_position.accept_plane?(self)
	end

end