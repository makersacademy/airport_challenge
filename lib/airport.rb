require_relative 'plane' 
require_relative 'weather'
include Weather

class Airport
	
	attr_reader :landed

	def land_plane(plane)
		raise "Planes cannot land during storms" if stormy?
		@landed = plane
	end

	def take_off
		@landed = nil
	end

end