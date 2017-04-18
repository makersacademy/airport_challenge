require_relative 'plane'

class Airport
DEFAULT_CAPACITY = 1
attr_reader :planes

	def initialize (capacity = DEFAULT_CAPACITY)
		@planes = []
		@capacity = capacity
	end

	def land(plane)
		if full? then raise 'Sorry the airport is full'
		else
		plane.landed
		@planes << plane
	end
	end

	def takeoff(plane)
		plane.takenoff
		@planes.delete(plane)
	end

	def full?
		if @planes.count >= @capacity
			true
		end
	end
end
