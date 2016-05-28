require 'airport.rb'
require 'plane.rb'

class Airport

	def initialize(capacity)
		@capacity = capacity
		@planes = 0
	end

	def arriving
		@planes += 1
	end

	def full?
		@planes >= @capacity
	end
end