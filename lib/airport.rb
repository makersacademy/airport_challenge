require_relative "plane"

class Airport

	attr_accessor :capacity

	def land_a_plane
	end

	def take_off
		Plane.new
	end

end