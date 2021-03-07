require 'plane'

class Airport
	attr_reader :plane

	def land(plane)
		fail 'Airport full' if @plane
		@plane = plane
	end

	def take_off
		fail 'No plane available' unless @plane
		@plane
	end
end