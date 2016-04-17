require_relative 'plane'
require_relative 'weather'
class Airport
	DEFAULT_CAPACITY = 50
	attr_reader :planes
	attr_accessor :capacity

	def initialize(weather = Weather.new, capacity = DEFAULT_CAPACITY )
	    @capacity = capacity
	    @planes = []
	    @weather = weather
	end 

	def land(plane)
		fail 'There is a storm occuring at the airport' if bad_weather
		fail 'Airport full' if full?
		planes << plane
	end

	def take_off(plane)
		fail 'No planes available' if empty?
		fail 'There is a storm occuring at the airport' if bad_weather
		planes.delete(plane)
	end


  	private

  	attr_reader :weather

  	def bad_weather
   		weather.stormy?
  	end 
  
  	def full? 
  		planes.count >= capacity
  	end
	def empty?
    	planes.empty?
    end
end