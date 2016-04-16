require_relative 'plane'
require_relative 'weather'
class Airport

	#DEFAULT_CAPACITY = 20
	
	#attr_accessor :capacity

	def initialize#(capacity=DEFAULT_CAPACITY)
	    #@capacity = capacity
	    @planes = []
	end 

	def land(plane)
		#raise 'Airport full' if full?
		planes << plane
	end

	def take_off(plane)
		weather = Weather.new
		if weather.stormy?
			raise 'There is a storm occuring'
		else
			planes.delete(plane)
		end
	end

  private 

  attr_reader :planes

  # def bad_weather
  # 	weather.storm
  # end
  # def full? 
  # 	bikes.count >= capacity
  # end
end