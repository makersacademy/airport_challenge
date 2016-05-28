require 'airport.rb'
require 'plane.rb'

class Plane
	attr_reader :status

	def land airport
	end

	def take_off airport
		fail "Can only take off from an airport" if airport.class != Airport
		@status = "Departed from: , going to: #{airport}"
	end
end  