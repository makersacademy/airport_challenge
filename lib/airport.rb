require_relative 'airplane'



class Airport
	DEFAULT_CAPACITY = 50
	attr_reader :capacity

	def initialize(capacity=DEFAULT_CAPACITY)
		@capacity = capacity #it will define the capacity of the airport when a different capacity is given
		@planes = [] #it will store the planes into the airport
	end

	def land(plane) #it will give permission to land
		if @planes.size >= capacity 
			raise 'Airport full, Permission Denied'
		else
		@planes << plane
		end
	end


	
end
