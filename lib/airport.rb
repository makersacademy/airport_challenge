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
		landed = true
		@planes << plane
		self
	end

	def take_off(plane)
		raise 'Weather is stormy, cannot take off' if stormy?
		landed = false
		@planes.delete(plane)
		self
	end


	private 

	def stormy?
		 @weather.stormy?
	end

	def landed
		@plane.landed
	end	

	def full?
		@capacity == @planes.count
	end

end