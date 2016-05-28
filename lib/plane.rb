


class Plane
	CANNOT_LAND_ERROR_MSG = "cannot land plane"
	CANNOT_TAKE_OFF_ERROR_MSG =  "cannot take_off plane"

	def initialize
		@current_airport = nil
		@weather = nil
	end

	def land(airport)
		if landed?
			raise CANNOT_LAND_ERROR_MSG
		else
			if @weather != nil && @weather.stormy?
				raise CANNOT_LAND_ERROR_MSG
			else
				@current_airport = airport if airport.land_plane?(self)
			end
		end

	end

	def take_off
		if landed?
			if @weather != nil && @weather.stormy?
				raise	CANNOT_TAKE_OFF_ERROR_MSG
			else
				@current_airport = nil
			end
		else 
			raise CANNOT_TAKE_OFF_ERROR_MSG
		end
	end

	def landed?
		@current_airport != nil
	end

	def get_airport
		@current_airport
	end

	def weather(weather)
		@weather = weather
	end

end
