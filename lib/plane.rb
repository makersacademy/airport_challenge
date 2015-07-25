class Plane

	def initialize 
		@flying = true
	end

	def flying?
		@flying
	end

	def land
		@flying = false
		return self
	end

	def landed?
		!flying?
	end

end
