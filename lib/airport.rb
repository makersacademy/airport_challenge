require "plane"
class Airport
	def initialize
		@planes = []
	end

	def planes
		@planes
	end

	def land plane
		@expecting = plane
		plane.land self
		@planes << plane
		@expecting = nil
	end

	def release_for_takeoff plane
		plane.take_off
		@planes.delete plane
	end

	def expecting? plane
		@expecting == plane
	end
end