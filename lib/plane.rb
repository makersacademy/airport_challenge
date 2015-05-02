class Plane

	attr_accessor :flying
	def initialize
		@flying = true
	end

	def flying?
		@flying
	end

	def landed?
		!@flying
	end

	def lands
		@flying = false
		@flying
	end

	def fly_again
		@flying = true
		@flying
	end
end
