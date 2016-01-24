require_relative 'airplane'
require_relative 'weather'

class Airport	
	DEFAULT_CAPACITY = 50
	attr_reader :capacity, :planes

	def initialize(capacity=DEFAULT_CAPACITY)
		@capacity = capacity 
		@planes = [] 
	end

	def land(plane)  
		raise 'The weather conditions does not allow Landing at the moment' if weather? == false 
		raise 'Airport full, Permission Denied' if @planes.size >= capacity 
		@planes << plane 
		print 'Landing..'
	end

	def takeoff(plane)
		raise 'The weather conditions does not allow Taking off at the moment' if weather? == false 
		raise 'No plains in the airport' if planes.size == 0 
		raise 'The plane selected is not in the airport, it can not take off' if @planes.include?(plane) == false
		@planes.each do |x|
			if x == plane 
				print 'Plane taking off..'
				@planes.delete(x)
				break
			end
		end
	end



end
