require_relative 'plane'
# require_relative 'weather'

class Airport

DEFAULT_CAPACITY = 100

	attr_reader :planes

	def initialize
		@landed_planes = []
		@capacity
	end

	def land(plane)
		# raise 'Too stormy to land planes' if weather.stormy?
		raise 'The airport is full' if @landed_planes.length >= 100
		@landed_planes << plane 
	end

	def takeoff(weather)
		# raise 'Too stormy to takeoff' if weather.stormy?
		@airport = false
	end

	def capacity(capacity=DEFAULT_CAPACITY)
		@capacity = capacity
	end

end
