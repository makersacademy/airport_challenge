require_relative 'plane'
class Airport

	DEFAULT_CAPACITY = 10

	attr_accessor :capacity

	def initialize capacity = DEFAULT_CAPACITY
		@planes = []
		@capacity = capacity
	end

	def land plane
		fail "no spaces available" if full?
		@planes << plane
	end

	def take_off
		fail "No planes available" if empty?
		released = planes.pop
		@planes.delete(released)
		released
	end

	def full?
		@planes.size >= capacity
	end

	def empty?
		@planes.empty?
	end
end
