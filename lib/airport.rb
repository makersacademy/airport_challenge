require_relative 'weather'

class Airport
	 attr_reader :capacity, :planes, :weather
	# ask which is better, DEFAULT_CAPACITY or using ruby keyword arguments
	 def initialize(capacity: 100, weather: Weather.new)
		  @capacity = capacity
		  @planes = []
		  @weather = weather
	 end
	 
	 def land plane
		  fail 'Airport is full!' if full?
		  fail "It's too stormy to land!" if stormy?
		  planes << plane
	 end

	 def depart plane
		  fail "That plane isn't here!" unless planes.include?(plane)
		  fail "It's too stormy to takeoff!" if stormy?
		  planes.delete(plane)
	 end

	private

	 def full?
 		 planes.count >= capacity
	 end
	 
	 def stormy?
		weather.stormy?
	 end

end
