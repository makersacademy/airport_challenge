require_relative 'planes'
class Airport

	attr_reader :planes

	def initialize 
		@planes = []
	end
	
	def land(plane)
		fail "Plane has already landed!" if planes.include?(plane) 
		@planes << plane
		plane.landed
	end

	def takeoff(plane)
		fail "Plane not in airport" unless planes.include?(plane)
		@planes.delete(plane)
		plane.flying
	end


	

end 