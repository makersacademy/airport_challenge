require 'airport.rb'
require 'plane.rb'
require 'weather.rb'

class Airport
	include Weather

	def initialize(capacity = 5)
		@capacity = capacity
		@planes = []
	end

	def arrival(plane)
		fail "Can't land during stormy weather" if !Weather.good_forecast?
		fail "Airport full!" if full?
		@planes << plane
		plane.land(self)
	end

	def departure(destination_Airport)
		fail "Can't take off during stormy weather" if !Weather.good_forecast?
		@planes.pop.take_off(destination_Airport)
	end

	private
	def full?
		@planes.length >= @capacity
	end
end