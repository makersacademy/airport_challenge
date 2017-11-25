require "plane"
class Airport
	def initialize
		@planes = []
	end

	def planes
		@planes
	end

	def land plane
		@planes << plane
		plane.land self
	end

	def release plane
		@planes.delete plane
	end

end