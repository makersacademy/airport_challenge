require_relative 'airplane'
require_relative 'weather'



class Airport
	
	DEFAULT_CAPACITY = 50
	attr_reader :capacity, :planes

	def initialize(capacity=DEFAULT_CAPACITY)
		@capacity = capacity #it will define the capacity of the airport when a different capacity is given
		@planes = [] #it will store the planes into the airport

	end

	def land(plane) #it will give permission to land 
		if weather? #it will return false or true depending of a random number therefore impossible to test
			if @planes.size >= capacity 
				raise 'Airport full, Permission Denied'
			else
				@planes << plane #it send the planes into the airport
			print 'Landing..'
			end
		else
			raise 'The weather conditions does not allow Landing at the moment'
		end
	end

	def takeoff(plane)
		if weather? #it will return false or true depending of a random number therefore impossible to test
			if planes.size == 0 #it will check if there are plains or not in the airport.
				raise 'No plains in the airport'
			else
				@planes.each do |x|
					if x == plane 
						print 'Plane taking off..'
						@planes.delete(x)
						break
					else
						puts 'The plane selected is not in the airport, it can not take off'
					end
				end
			end
		else
			raise 'The weather conditions does not allow Taking off at the moment'
		end
	end



end
