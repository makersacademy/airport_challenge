require_relative 'plane'

class Airport
	
	DEFAULT_CAPACITY = 15

	attr_accessor :capacity

	def initialize
		@planes = []
		@capacity = DEFAULT_CAPACITY
	end

	def release_plane
		fail 'Airport is empty, no planes available' if empty?
		fail 'Weather is too stormy to take off' if stormy?
		plane = @planes.pop
		plane.take_off
	end

	def land_plane (plane)
		fail 'Airport is full, plane cannot land' if full?
		fail 'Weather is too stormy to land' if stormy?
		@planes << plane
		plane.land
	end


# private

	def empty?
		@planes.empty?
	end

	def full?
		@planes.size >= capacity
	end

	def stormy?
		true if rand(5) == 2
	end

end
