class Airport

	DEFAULT_CAPACITY = 20

	attr_reader :capacity
	attr_reader :apron

	def initialize(capacity = DEFAULT_CAPACITY)
		@capacity = capacity
		@apron = []
  	end

  	def land(airplane, weather)
  		if landing_permission(weather) == true && airplane.flying? == true
  			airplane.land
  			@apron << airplane
  		end
  	end	

  	def fly(weather)
  		if take_off_permission(weather) == true
  			airplane = remove_plane
  			airplane.take_off
  			airplane
  		end
  	end	
		
	def full?
		if @apron.count >= @capacity
			true
		else
			false
		end
	end

	def take_off_permission(weather)
		weather.clear?
	end	

	def landing_permission(weather)
		if weather.clear? == true && full? == false
			return true
		else
			false
		end
	end	

	private
  	
  	def remove_plane
  		@apron.pop
  	end	
end
	