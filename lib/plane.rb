# a plane should land
# a plane should take off

class Plane 
	attr_reader :flying, :airport

	def initialize(flying = true)
		@flying = flying
		@airport = nil
	end 

	def land
		raise "Plane has already landed" unless @flying
		@flying = false
		@airport = airport
		
	end 

	def take_off
		raise "Plane is already flying" if @flying	
	end 

end 