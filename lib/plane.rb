# a plane should land
# a plane should take off

class Plane 
	attr_reader :flying, :airport_planes

	def initialize(flying = true)
		@flying = flying
		@airport_planes = nil 
	end 

	def land
	end 

	def take_off
		raise "Plane is already flying" unless @flying == false
	end 

end 