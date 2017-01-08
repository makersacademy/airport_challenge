require_relative 'plane'
require_relative 'weather'
class Airport

	attr_accessor :capacity, :planes

	DEFAULT_CAPACITY =1

	def initialize(capacity = DEFAULT_CAPACITY)
		@capacity =  capacity
		@planes = []
		@weather = Weather.new
	end


	def land(plane)
		raise 'Airport is full' if full?
		raise 'Weather is stormy, cannot land' if stormy?
		@planes << plane
	end

	def take_off(plane)
		raise 'Weather is stormy, cannot take off' if stormy?
		@planes.delete(plane)
	end


	private 

	def stormy?
		 @weather.stormy?
	end	

	def full?
		@capacity == @planes.count
	end

end