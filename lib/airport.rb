require_relative 'plane' 
require_relative 'weather'
include Weather

class Airport
	
	attr_reader :grounded

	def land_plane(plane)
		raise "Planes cannot land during storms!" if stormy?
		raise "The airport is full!" if @grounded
		@grounded = plane
	end

	def take_off
		raise "Planes cannot take off during storms!" if stormy?
		@grounded = nil
	end

end