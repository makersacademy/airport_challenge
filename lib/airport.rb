require_relative 'plane' 
require_relative 'weather'

class Airport
	
	attr_reader :landed

	def land_plane(plane)
		@landed = plane
	end

	def take_off
		@landed = nil
	end

end