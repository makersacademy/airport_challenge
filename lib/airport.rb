require_relative 'plane'
class Airport

	attr_accessor :capacity, :planes

	DEFAULT_CAPACITY =10

	def initialize(capacity = DEFAULT_CAPACITY)
		@capacity =  capacity
		@planes = []
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
		 rand(1..100) > 50? true : false
	end	

	def full?
		@capacity == @planes.count
	end

end