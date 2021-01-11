require_relative 'plane'

class Airport

		DEFAULT_CAPACITY = 10
		
		attr_reader :hanger

		def initialize(capacity = DEFAULT_CAPACITY)
				@hanger = []
				@capacity = capacity
		end

		def land(plane, weather)
				fail "Airport at capacity" if full?

				fail "Planes unable to land because of storms" if weather
				
				plane = plane
				weather = self.stormy?
				hanger << plane
				puts "#{plane} has landed"
				plane
		end

		def take_off(plane, weather)
				plane = plane 
				fail "Planes grounded because of storms" if weather 

				hanger.include?(plane)
				hanger.reject! { |x| x == plane } 
				puts "#{plane} has taken off"
				self
		end 

		def stormy?
				rand(1..10) > 9
		end 

		def full?
			hanger.count >= DEFAULT_CAPACITY ? true : false
		end 

end
