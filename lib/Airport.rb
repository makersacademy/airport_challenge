require 'Plane'
require 'Weather'

class Airport

	include Weather

	attr_reader :landed_planes, :flying_planes
	attr_accessor :capacity

	MAXIMUM_CAPACITY = 10

	def initialize(capacity = MAXIMUM_CAPACITY)
		@landed_planes = []
		@flying_planes = []
		@capacity = capacity
	end 

	def land(plane)
		if stormy?
			raise 'No landing due to stormy weather' if stormy?
		else
			landed_planes.push(plane)
		end  
	end 

	def take_off(plane)
		flying_planes << landed_planes.pop
		raise 'No take off due to stormy weather' if stormy?

	end 


end
