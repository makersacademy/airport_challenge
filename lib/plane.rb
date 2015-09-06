class Plane

	def initialize
		@status = true
	end

	def flying?
		@status
	end

	def landed?
		not flying?
	end

end
