require_relative 'plane'

class Airport
	DEFAULT_CAPACITY = 10
	attr_accessor :capacity

	def initialize
		@capacity ||= DEFAULT_CAPACITY
		@planes = []
	end

	def land plane
		fail "Airport is full" if full?
		plane.lands
		@planes << plane
	end

	def release
		fail "No planes to take off" if empty?
		@planes.last.fly_again
		@planes.pop
	end

	attr_reader :planes
	private

	def empty?
		@planes.empty?
	end

	def full?
		@planes.length >= DEFAULT_CAPACITY
	end

end
