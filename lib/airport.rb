require_relative 'plane'

class Airport
	attr_reader :planes

	def initialize
		@planes = []
	end

	def land_plane(this_plane)
		this_plane.land
		planes << this_plane
	end

	def fly_plane(this_plane)
		this_plane.fly
		planes.pop
	end

end