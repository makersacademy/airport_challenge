require 'airport.rb'
require 'plane.rb'

class Plane

	def land destination_Airport
		fail "Can only land in an airport" if destination_Airport.class != Airport
		@status = "Landed in: #{destination_Airport}"
	end

	def take_off destination_Airport
		fail "Can only take off from an airport" if destination_Airport.class != Airport
		@status = "Departed to: #{destination_Airport}"
	end

end