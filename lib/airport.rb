require './lib/plane.rb'

require './lib/weather.rb'



class Airport


attr_reader :capacity,:container

DEFAULT_CAPACITY = 50

	def initialize (capacity = DEFAULT_CAPACITY)

		@weather = Weather.new
		@capacity = capacity
		@container = []

		
	end


	def take_off(plane , weather=@weather)
		
		if weather.stormy?
			raise "Cannot take off in stormy weather" 
		else
			@container.delete(plane)
			@container
		end

	end


	def land (plane, weather=@weather)
		
		if weather.stormy?
			raise "Cannot land in stormy weather"
		elsif self.full?
			raise "Error: airport is full"
		else
    	@container << plane
   	end
	end

 
	def full? 
		@container.length >= capacity
	end
	

end