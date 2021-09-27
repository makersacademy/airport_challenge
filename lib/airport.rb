class Airport
	 attr_accessor :capacity
	 attr_accessor :weather
	 attr_reader :planes_at_airport

	 DEFAULT_CAPACITY = 5

	 def initialize(capacity = DEFAULT_CAPACITY)
		  @capacity = capacity
		  @planes_at_airport = []
		  @weather = Weather.new
	 end
	
	 def full?
		  @planes_at_airport.length >= @capacity
	 end
	
	 def successfully_land(plane)
		  fail 'airport is full' if full?
		  @planes_at_airport << plane
		  return plane
	 end
	
	 def successful_takeoff(plane)
		  while @planes_at_airport.include?(plane)
			  @planes_at_airport.delete_at(@planes_at_airport.index(plane))
			  p "Plane #{plane} HAS LEFT THE AIRPORT!!"
		  end
	 end

	 def stop_landing(plane)
		  fail 'Unable to land plane at airport due to stormy weather' if @weather.stormy?
		  plane
	 end
	
	 def stop_takeoff(plane)
		  fail 'Unable to take off due to stormy weather' if @weather.stormy?
		  @plane = plane
	 end
end
