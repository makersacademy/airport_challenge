require_relative 'Plane'

class Airport

	attr_reader :planes, :capacity

	DEFAULT_CAPACITY = 20

	def initialize(capacity=DEFAULT_CAPACITY)
		@planes = []
		@capacity = DEFAULT_CAPACITY
	end

	def land(plane)
		raise "Can not land, airport is full!" if full?
		planes << plane
	end

	def take_off
		planes.pop
	end

	def full?
		planes.length >= capacity
	end

	module weather
		
	end



end
