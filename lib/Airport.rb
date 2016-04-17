
require_relative 'Plane'

class Airport

	attr_reader :plane

	def land(plane)
		true
	end

	def take_off(plane)
		true
	end

end