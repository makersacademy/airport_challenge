class Plane

	def initialize(status = "airborne")
		@status = status
	end

	def status
		@status
	end

	def set_landed
		@status = "landed"
	end

	def set_airborne
		@status = "airborne"
	end

end