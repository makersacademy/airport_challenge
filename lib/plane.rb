class Plane

	def initialize
		@flying = 'hello'
	end

	def flying?
		@flying
	end

	def land airport
		@flying = false
	end

	def take_off airport
		@flying = true
	end


end


