
require_relative 'plane'

require_relative 'weather'

class Airport

	attr_reader :planes, :capacity, :weather

	DEFAULT_CAPACITY = 50

	def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
		@capacity = capacity
		@planes = []
		@weather = weather
	end


	def land(plane)
		fail 'the plane hasnt taken off yet' if plane.flying? == false
		fail 'the weather is stormy' if stormy? == true
		fail 'no spaces available' if full?
		planes << plane
	end


	def release_planes
		fail 'the weather is stormy' if stormy? 
		planes.pop
		planes
	end


 	private


    def full?
        planes.count >= capacity
    end


end
