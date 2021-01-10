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

		def take_off(plane, weather)
				plane = plane 
				fail "Planes grounded because of storms" if weather 

				hanger.include?(plane)
				hanger.reject! do 
					|x| x == plane
				end
				puts "#{plane} has taken off"
				self
		end 

		def stormy?
				x = rand(1..6)
				x == 6 ? true : false
		end 

end
