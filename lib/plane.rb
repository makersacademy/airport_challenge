class Plane
	def initialize
		@flying = true
	end

	def flying? 
		@flying
	end

	def land?
		@flying = false
	end
end