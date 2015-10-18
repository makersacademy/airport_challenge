class Plane

	def initialize
		@flying = true
	end

	def has_landed
		@flying = false 
	end

	def has_taken_off
		@flying  = true
	end

	def is_flying?
		@flying
	end

end