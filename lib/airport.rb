
require_relative 'plane'
require_relative 'weather'

class Airport

	include Weather

DEFAULT_CAPACITY = 20
attr_reader :capacity, :planes

	def initialize
		@planes = []
		@capacity = DEFAULT_CAPACITY
	end

	def take_off_plane
		fail 'No planes at airport' if empty?
		fail 'Stormy weather' if weather == :stormy
		planes.pop
	end

	def land(plane)
		fail 'Airport is full.' if full?
		fail 'Stormy weather' if weather == :stormy
		planes << plane
	end

	private

	def full?
		planes.count >= capacity
	end

	def empty?
		planes.empty?
	end
end
