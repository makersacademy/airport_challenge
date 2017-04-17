require './lib/plane.rb'

require './lib/weather.rb'



class Airport


attr_reader :capacity 

DEFAULT_CAPACITY = 50

	def initialize (capacity = DEFAULT_CAPACITY)

		@weather = Weather.new
		@capacity = capacity
		@container = []
	end


	def landed_planes
		@container.dup
	end

	def take_off(plane , weather=@weather)
		
		if weather.stormy?
			raise "Cannot take off in stormy weather" 
		elsif self.taken_off?(plane)
			raise "Error: this plane is reported as already in flight"
		else
			@container.delete(plane)
			@container
		end

	end


	def land (plane, weather=@weather)
		
		if self.full?
			raise "Error: airport is full"
		elsif self.landed?(plane)
			raise "Error: this plane is reported as already landed"
		elsif weather.stormy?
			raise "Cannot land in stormy weather"
		else
    	@container << plane
   	end
	end


	def landed? (plane)
 
 		 @container.include?(plane)#How to I check whether it includes this
 		
 	end

 	def taken_off? (plane)

 		 !@container.include?(plane)
 			
 	end



	def full? 
		@container.length >= capacity
	end
	

end