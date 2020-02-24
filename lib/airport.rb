require_relative './plane.rb'
require_relative './weather.rb'

class Airport
	DEFAULT_CAPACITY = 5
	attr_reader :planes, :capacity, :weather
	def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
		@capacity = capacity
		@planes = []
		@weather = weather
	end

	def change_capacity(num)
		@capacity = num
	end

	def land(plane)
		fail 'this airport is full!' if full?
		fail 'You cant land! The weather is stormy!' if @weather.stormy?
		fail 'This plane has already landed.' if @planes.include? plane

		@planes << plane
		@planes[-1]
	end

	def take_off(plane)
		fail 'This plane is already flying.' unless @planes.include? plane

		fail 'You cant take off! The weather is stormy!' if @weather.stormy?

		@planes.delete(plane) if @planes.include? plane
			  
		'The plane has taken off and is no longer in the airport' 

	end

	def full?
		@planes.length >= @capacity
	end
end
