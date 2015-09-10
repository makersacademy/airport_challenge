class Plane

	def initialize
		@status = true
	end

	def flying?
		@status
	end

	def land
		@status = false
	end

	def landed?
		not flying?
	end

	def take_off
		@status = true
	end

end
