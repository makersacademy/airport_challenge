require 'Plane'

class Airport

attr_accessor :landed

	def initialize
		@landed = []
	end

	def land(plane)
		plane_exist?(plane)
		raise ArgumentError, 'Plane already landed' if at_airport?(plane)
		@landed << {plane: plane, id: plane.id}
	end

	def at_airport?(plane)
		there = false
		@landed.each {|hash| there = true if hash[:id]==plane.id}
		there
	end

	def plane_exist?(plane)
		raise ArgumentError, 'Not a valid plane object' unless plane.class == Plane
		raise ArgumentError, 'Plane does not exist' unless Plane.class_variable_get(:@@planes) >= plane.id
	end

	def takeoff(plane)
		plane_exist?(plane)
		raise ArgumentError, 'Plane not at this airport' unless at_airport?(plane)
		@landed.delete_if {|hash| hash[:id] == plane.id}
	end

end
