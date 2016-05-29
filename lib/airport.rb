require 'airport.rb'
require 'plane.rb'
require 'weather.rb'

class Airport

	def initialize(capacity)
		@capacity = capacity
		@planes = []
	end

	def arrival(plane)
		fail "Can't land during stormy weather" if Weather.good_forecast?
		fail "Airport full!" if full?
		@planes << plane
		plane.land(self)
	end

	def departure(plane)
		fail "Can't take off during stormy weather" if Weather.good_forecast?
		@planes.pop.take_off(self)
	end

	private
	def full?
		@planes.length >= @capacity
	end
end