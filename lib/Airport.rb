require 'Plane'

class Airport

attr_accessor :landed

	def initialize
		@landed = []
	end

	def land(plane)
		plane_id = plane.id
		raise ArgumentError 'Plane already landed' if @landed.include?(plane_id)
		raise ArgumentError 'Plane does not exist' if Plane.class_variable_get(:@@planes) < plane_id
		
		@landed << plane_id 
	end

	def takeoff
		@landed.pop
	end

end
