require_relative 'plane'

class Airport
	DEFAULT_CAPACITY = 10
	attr_accessor :capacity
	attr_reader :stormy

	def initialize
		@capacity ||= DEFAULT_CAPACITY
		@planes = []
		@stormy = false
	end

	def rand_weather_change
		if rand(2) == 0 
			@stormy = true
		else 
			@stormy = false
		end
	end

	def land plane
		fail "Airport is full" if full?
		fail "Weather is stormy" if stormy?
		plane.lands
		@planes << plane
	end

	def release
		fail "No planes to take off" if empty?
		fail "Weather is stormy" if stormy?
		@planes.pop.fly_again
	end

	def stormy?
		@stormy
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
