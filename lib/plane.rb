require_relative 'airport'

class Plane

	def initialize (landed = false)
		@landed = landed
	end

	def flying?
		!@landed
	end

	def land
		@landed = true
	end

	def landed?
		@landed
	end

	def takeoff
		@landed = false
	end
end

