require_relative 'airplane'



class Airport
	DEFAULT_CAPACITY = 50
	attr_reader :capacity, :planes

	def initialize(capacity=DEFAULT_CAPACITY)
		@capacity = capacity #it will define the capacity of the airport when a different capacity is given
		@planes = [] #it will store the planes into the airport
	end

	def land(plane) #it will give permission to land 
		if @planes.size >= capacity 
			raise 'Airport full, Permission Denied'
		else
		@planes << plane #it send the planes into the airport
		print 'Landing..'
		end
	end

	def takeoff(plane)
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

	def stormgenerator
		x = rand(10)
		if x > 7 then false else true end
	end		



	
end
