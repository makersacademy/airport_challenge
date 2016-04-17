require_relative 'plane'
require_relative 'weather'

class Airport
	DEFAULT_CAPACITY = 20
    attr_reader :planes, :capacity,:weather
    
    def initialize(weather = Weather.new,capacity = DEFAULT_CAPACITY)
    	@planes = []
    	@capacity = capacity
    	@weather = weather
    end	
	
	def landing(plane)
		raise "Airport is full" if full?
		raise "Unable to land due to stormy weather" if weather.stormy?
		@planes << plane if plane.landed?
	end	

	def departure(plane)
		@planes.pop if planes.include? plane
	end	

	private

	def full?
		@planes.count >= capacity
	end	
end
