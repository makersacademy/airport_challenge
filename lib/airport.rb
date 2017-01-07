require_relative 'plane' 
require_relative 'weather'
include Weather

class Airport
	
	attr_reader :grounded

	def initialize
		@grounded = []
	end

	def land_plane(plane)
		raise "Planes cannot land during storms!" if stormy?
		raise "The airport is full!" if @grounded.count >= 10
		@grounded << plane
	end

	def take_off(plane)
		raise "Planes cannot take off during storms!" if stormy?
		@grounded = nil
	end

end