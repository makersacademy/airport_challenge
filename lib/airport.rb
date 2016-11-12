require_relative 'weather'
require_relative 'plane'

class Airport

	include Weather

	attr_reader :capacity, :planes

	DEFAULT_CAPACITY = 2

	def initialize(capacity = DEFAULT_CAPACITY)
		@planes = []
		@capacity = capacity
	end

	def land?(plane)
		full?
		return land_plane(plane) unless stormy?
		fail "#{plane} cannot land due to stormy weather."
	end

	def take_off?(plane)
		return release_plane(plane) unless stormy?
		fail "#{plane} cannot take off due to stormy weather."
	end

	private

		def full?
			fail "Airport is full." if @planes.length >= @capacity
		end

		def land_plane(plane)
			@planes << plane
			"#{plane} has landed."
		end

		def release_plane(plane)
			plane_index = @planes.index(plane)
			@planes.slice!(plane_index)
			"#{plane} has left the airport."
		end
end