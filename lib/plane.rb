
class Plane

attr_reader :flying

	def initialize
 		@flying = true
 		@landed = false
	end	


	def flying?
		@flying
	end

	def land
		@landed = true
		@flying = false
	end

	def landed?
		@land = true
		@landed = true
	end

	def take_off
		@flying = true
		@landed = false
	end

end
