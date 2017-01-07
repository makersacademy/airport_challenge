require_relative 'plane' 
require_relative 'weather'
include Weather

class Airport
	
	attr_reader :grounded, :capacity
	DEFAULT_CAPACITY = 10

	def initialize(capacity = DEFAULT_CAPACITY)
		@grounded = []
		@capacity = capacity
	end

	def land_plane(plane)
		raise "Planes cannot land during storms!" if stormy?
		raise "The airport is full!" if @grounded.count >= @capacity
		@grounded << plane
	end

	def take_off(plane)
		raise "Planes cannot take off during storms!" if stormy?
		@grounded = nil
	end

end