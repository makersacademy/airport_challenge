require './lib/plane'

class Airport

AIRPORT_CAPACITY = 20

	def initialize(options = {})
		@capacity = options.fetch(:capacity, AIRPORT_CAPACITY)
		@planes = []
	end

	def count_plane
		@planes.count
	end

	def land(plane)
		fail 'does not let plane land' if full?
    fail 'Bad weather' if stormy?
		plane.land?
		@planes << plane
	end

	def taking_off(plane)
		fail 'no planes available' if empty?
		plane.flying?
		@planes.pop
	end

def stormy?
  weather == :stormy
end

	private
  WEATHER = [:stormy, :fine]

	attr_reader :planes

def weather
  WEATHER.sample
end

	def full?
		count_plane == @capacity
	end

	def empty?
		@planes.empty?
	end	

end