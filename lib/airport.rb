
require_relative "plane"

class Airport

	attr_reader :planes
	attr_accessor :capacity


	DEFAULT_CAPACITY = 35

	def initialize
		@planes = []
		@capacity = capacity

	end

	def plane
		@plane

	end


	def plane_land(plane)
		@plane = plane
	end

	def plane_take_off
		Plane.new

	end


	private
	def stormy?
		rand(1...8) >= 5
	end

	def full?
		planes.count >= capacity
	end

end