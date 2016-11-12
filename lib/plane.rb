class Plane

	attr_reader :flying

	def initialize
		@flying = true
	end

	def landed
		@flying = false
	end

	def taken_off
		@flying = true
	end

end