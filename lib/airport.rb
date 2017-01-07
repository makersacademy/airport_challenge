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
		raise "The airport is full!" if full?
		raise "That plane is already grounded!" if !flying?(plane)
		@grounded << plane
	end

	def take_off(plane)
		raise "Planes cannot take off during storms!" if stormy?
		raise "That plane is not in the airport!" if !plane_present?(plane)
		@grounded.delete(plane)
	end

	private

	def full?
		@grounded.count >= @capacity
	end

	def plane_present?(plane)
		@grounded.include?(plane)
	end

	def flying?(plane)
		plane.airborne
	end

end