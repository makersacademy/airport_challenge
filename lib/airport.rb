
require_relative 'plane'
require_relative 'weather'

class Airport
	attr_reader :plane

	def land(plane)
		@plane = plane
		"Plane has landed"
	end

	def take_off(stormy)
		if stormy
			puts "It's stormy, I cannot take off"
			@plane
		else
			@plane = nil
			puts "Plane has taken off"
			@plane
		end
	end

	def full?
		if @plane.nil?
			false
		else
			true
		end
	end

end