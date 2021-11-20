require_relative 'plane.rb'

class Airport
	def initialize
		@hangar = []
	end

	def land(plane)
		raise "Airport full" if @hangar.length == 1
		@hangar.push(plane)
	end

	def take_off
		@hangar.pop
		"Plane successfully departed."
	end


end

# jfk = Airport.new
# p jfk
# plane = Plane.new
# p plane
# plane.land