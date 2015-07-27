class Plane
	def initialize
		@flying = true
	end 
	
	def landed?
		!@flying
	end

	def flying?
		@flying
	end

	def report_flying
		@flying = true
	end

	def report_landed
		@flying = false
	end
end
