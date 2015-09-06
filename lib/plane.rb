
# Assume all newly creates planes are flying

class Plane
	def initialize
		@flying = true
	end

	def flying?
		@flying
	end

	def landed?
		!@flying
	end

	def land
		@flying = false
	end

	def take_off
		@take_off = true
	end

end


# Assume all newly creates planes are flying