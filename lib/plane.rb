class Plane

	def initialize 
		@flying = true
	end

	def flying?
		@flying
	end

	def report_landed
		@flying = false
	end

	def landed?
		!flying?
	end

	def report_take_off
  	@flying = true
	end

end
