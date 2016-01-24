require 'Plane'
require 'Weather'

class Airport

	include Weather

	attr_reader :landed_planes, :flying_planes

	def initialize
		@landed_planes = []
		@flying_planes = []
	end 


	def land(plane)
		landed_planes.push(plane)
	end 

	def take_off(plane)
		flying_planes << landed_planes.pop
	end 

	def bad_weather
		raise 'No take off due to stormy weather' unless sunny?
	end 

end
