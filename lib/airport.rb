require_relative 'plane'

class Airport
	CAPACITY = 100
	attr_accessor :capacity

	def initialize (capacity = CAPACITY)
		@planes = []
		@capacity = capacity
	end

	def touch_down(plane)
		fail 'Airport is full' if full?
		plane.land
		planes << plane
	end

	def depart
		fail 'Airport is empty' if empty?
		plane = planes.pop
		plane.take_off
	end

	private

	attr_reader :planes

	def full?
		planes.count >= capacity
	end

	def empty?
		planes.empty?
	end

end
