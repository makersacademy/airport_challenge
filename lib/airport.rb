require_relative 'plane'

class Airport
	
	attr_reader :landed

	def land_plane(plane)
		@landed = plane
	end

	def take_off

	end

end