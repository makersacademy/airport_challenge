require_relative 'weather'
require_relative 'plane'

class Airport

	include Weather

	DEFAULT_CAPACITY = 2

	def initialize(capacity = DEFAULT_CAPACITY)
		@planes = []
		@capacity = capacity
	end

	def land(plane)
		raise "#{plane} is already on the ground." if plane.flying == false
		full?
		return accept_plane(plane) unless stormy?
		raise "#{plane} cannot land due to stormy weather."
	end

	def take_off(plane)
		raise "#{plane} is already flying." if plane.flying == true
		raise "#{plane} does not exist at this airport." unless @planes.include?(plane)
		return release_plane(plane) unless stormy?
		raise "#{plane} cannot take off due to stormy weather."
	end

	private

		def full?
			raise "Airport is full." if @planes.length >= @capacity
		end

		def accept_plane(plane)
			plane.landed
			@planes << plane
			"#{plane} has landed."
		end

		def release_plane(plane)
			plane.taken_off
			plane_index = @planes.index(plane)
			@planes.slice!(plane_index)
			"#{plane} has left the airport."
		end

end