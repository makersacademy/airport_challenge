require_relative "plane"

class Airport

	attr_accessor :capacity, :planes

	def land_a_plane

		if @planes
			@planes += 1
		else
			@planes = 1
		end
	end

	def take_off
		Plane.new
	end

end