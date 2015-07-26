
class Airport

DEFAULT = 1

	def initialize
		@capacity = DEFAULT
		@planes = []
		@weather_state = true
	end

	def capacity
		@capacity
	end

	def plane_in plane # evaluate a request to land
		if (@planes.size >= @capacity) || (self.weather_state == false)
			return false # Tower: No
		 else 
		 	@planes << plane
		 	return true # Tower: yes
		 end
	end

	def plane_out plane # evaluate a request to take off

		if self.weather_state 
			@planes.delete(plane)
			return true # Toewer: Yes
		else
			return false # Tower: No
		end
	end

	def plane_size
		@planes.size
	end

	def weather_state #
		@weather_state = WeatherReport.new.state
	end


end

