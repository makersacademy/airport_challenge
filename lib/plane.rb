
class Plane

	def initialize
		@flying = true
	end

	def flying?
		@flying
	end

	def land airport # Pilot: can I land
		if airport.plane_in(self)
			@flying = false # Tower: Yes
		else 
			@flying = true # Tower: No
		end
		@flying 
	end

	def take_off airport # Pilot: Can I take off
		@flying = airport.plane_out(self) # Tower: Maybe
	end

end


