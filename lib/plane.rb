require "weather"

class Plane
	CANNOT_LAND_ERROR_MSG = "cannot land plane"
	CANNOT_TAKE_OFF_ERROR_MSG =  "cannot take_off plane"
	SKY = Sky.new
	NO_WEATHER = NoWeather.new

	def initialize
		@position =  SKY
		@weather = NO_WEATHER
	end

	def land(airport)
		new_position = airport
		#is the transition ok?
		if !landed? 
			if @weather.stormy?
				raise "error"
			else
				@position = new_position if new_position.accept_plane?(self)
			end
		else
			raise "error"
		end
		# change_position(airport)
	end

	def take_off
		new_position = SKY
		#is the transition ok?
		if landed? 
			if @weather.stormy?
				raise	"error"
			else
				@position = new_position  if new_position.accept_plane?(self) 			end
		else 
			raise "error"
		end
		# change_position(SKY)
	end	

	def transition_ok?(new_position)
		if new_position.is_airport
			return !landed
		end
		if (new_position.is_airport == false)
			return landed?
		end
	end


	def change_position(new_position)

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

	def defunct_change_position(new_position = SKY)
			if transition_ok?(new_position)
				transition(new_position)
			else; raise "error"; end
	end


	def transition(new_position)
		@position.release_plane(self) 
		new_position.receive_plane(self)
		@position = new_position
	end

end
