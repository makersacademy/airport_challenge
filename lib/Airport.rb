require 'Plane'
require 'Weather'

class Airport

	include Weather

	attr_reader :landed_planes, :flying_planes
	attr_accessor :capacity
  #> capactity should readd be att_reader not attr_accessor

	MAXIMUM_CAPACITY = 10

	def initialize(capacity = MAXIMUM_CAPACITY)
		@landed_planes = []
		@flying_planes = []
		@capacity = capacity
	end 

	def land(plane)
		raise 'No landing due to stormy weather' if stormy?
		landed_planes.push(plane)
    plane.land 
	end 

	def take_off(plane)
		raise 'No take off due to stormy weather' if stormy?
    flying_planes << landed_planes.pop
    plane.takes_off
	end 

end
