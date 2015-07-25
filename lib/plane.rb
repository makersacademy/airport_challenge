require 'airport.rb'
class Plane

	def initialize
		@flying = true
	end

	def flying?
		@flying
	end

	def land airport
		airport.plane_in(self)
		@flying = false
	end

	def take_off airport 
		@flying = true
	end

end


