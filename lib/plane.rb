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
		unless landed?
			if @weather.stormy?
				raise CANNOT_LAND_ERROR_MSG
			else
				@position = airport if airport.accept_plane?(self)
			end
		else
			raise CANNOT_LAND_ERROR_MSG
		end

	end

	def take_off
		if landed?
			if @weather.stormy?
				raise	CANNOT_TAKE_OFF_ERROR_MSG
			else
				@position = SKY
			end
		else 
			raise CANNOT_TAKE_OFF_ERROR_MSG
		end
	end

	def landed?
		@position.is_airport?
	end

	def get_airport
		@position
	end

	def weather(weather)
		@weather = weather
	end

	private

	def changeposition(new_position)
			#DRY take off and landing
	end

end
