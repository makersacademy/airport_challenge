require_relative 'plane'

class Airport

		DEFAULT_CAPACITY = 10
		
		attr_reader :hanger

		def initialize
				@hanger = []
		end

		def land(plane)
				fail "Airport at capacity" if hanger.count >= DEFAULT_CAPACITY
				
				plane = plane
				hanger << plane
				plane
		end

		def take_off(plane)
				plane = plane 
				hanger.reject! do 
					|x| x == plane
				end
				puts "#{plane} has taken off"
				self
		end 

end
