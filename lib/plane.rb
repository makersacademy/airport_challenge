
class Plane

	def flying?
		@flying
	end

	def taken_off
		@flying = true
	end

	def report_landed
		@flying = false
	end

end