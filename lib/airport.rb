require 'airport.rb'
require 'plane.rb'

class Airport

	def initialize(capacity)
		@capacity = capacity
		@planes = 0
		@good_weather = true 
	end

	def arrival
		fail "Can't land during stormy weather" if !@good_weather
		@planes += 1
	end

	def departure
		fail "Can't take off during stormy weather" if !@good_weather
		@planes -= 1
	end

	def change_weather
		@good_weather = !@good_weather
	end

	private
	def full?
		@planes >= @capacity
	end
end