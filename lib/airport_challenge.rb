class Airport

	attr_accessor :plane, :airport

	def initialize
		@airport = []
	end

	def land(plane)
		@airport << plane
	end

	def take_off(*)
		@airport.pop
		puts "This plane has just taken off!"
	end
end

class Plane

	def initialize
		@plane
	end

end