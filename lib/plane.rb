
class Plane

	def initialize
		@flying = true
	end

	def flying?
		@flying
	end

	def land airport
		if airport.plane_in(self)
			@flying = false
		else 
			@flying = true
		end
		@flying 
	end

	def take_off airport 
		airport.plane_out(self)
		@flying = true
	end

end


