class Airport
	attr_accessor :capacity
	attr_reader :planes_at_airport
	attr_accessor :weather_today

	DEFAULT_CAPACITY=100

	def initialize(capacity = DEFAULT_CAPACITY)
		@capacity = capacity
		@planes_at_airport = []
		@weather_today = Weather.new
	end

	def full?
		@planes_at_airport.length == @capacity
	end

	#planes land at airport and get added to the list of planes at the airport
	def land_plane(plane)
		fail 'airport is full' if full?
		@planes_at_airport << plane
		@plane = plane

	end

	def plane_takeoff_confirmation
		@planes_at_airport.pop 
		p "WE OUTTA HERE!!"
	end

	def prevent_takeoff(plane)
		fail 'Unable to take off due to stormy weather' if @weather_today.stormy?
		@plane = plane
	end

	def prevent_landing

	end

end
