require_relative 'plane'
class Airport
	def land plane
		plane.landed = true
		plane.flying = false
	end

	def take_off plane
		plane.flying = true
		plane.landed = false
	end
end
