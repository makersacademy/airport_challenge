require_relative 'weather'
require_relative 'plane'

class Airport
	DEFAULT_CAPACITY = 10

	attr_reader :capacity

	def initialize(capacity = DEFAULT_CAPACITY)
		@capacity = capacity
		@planes = []
	end

	def land plane
		raise 'Plane is not flying' if !plane.is_flying?
		raise 'Airport is full' if full? #not working?????
		raise 'Too stormy to land' if stormy_weather?
		plane.has_landed; @planes << plane
	end

	def take_off plane
		raise 'Plane is currently flying' if plane.is_flying?
		raise 'Too stormy to take off' if stormy_weather?
		plane.has_taken_off; @planes.delete plane if airport_is_holding(plane) 
	end

	private

	attr_reader :planes

		def full?
    		true if @planes.count >= @capacity
    	end

    	def stormy_weather?
    		weather = Weather.new
    		true if weather.stormy? == true
    	end

    	def airport_is_holding plane
    		true if @planes.include? plane
    	end
end
