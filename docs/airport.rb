require_relative 'weather'

class Airport

DEFAULT_CAPACITY = 50

attr_reader :capacity, :storage

	def initialize(capacity=DEFAULT_CAPACITY)
		@capacity = capacity
		@storage = []
		@weather = Weather.new
	end

	def in_airport?(plane)
		storage.include?(plane)
	end

	def accepts_plane(plane)
		if airport_open?
			fail 'This airport is full. Do not land.' if full?
			fail 'This plane is already at an airport.' if plane.plane_status == false	
			storage << plane 
			plane.landed
		else
			announcement
		end
	end

	def releases_plane(plane)
		if airport_open?	
			fail 'This plane is already in the air, so it cannot take off.' if plane.plane_status		
			fail 'This plane is not at this airport, so it cannot take off from here.' if in_airport?(plane) == false
			storage.delete(plane)
			plane.flying
		else
			announcement
		end
	end

	def plane_location(plane)
		plane.plane_status ? 'This plane is flying.' : find_plane(plane)
	end

	def all_planes
		ObjectSpace.each_object(Plane).to_a
	end

	private 

	def announcement
		"Due to stormy weather, this airport is closed." 
	end

	def find_plane(plane)
		airports = ObjectSpace.each_object(Airport).to_a
		found =	airports.select {|airport| airport.in_airport?(plane)}
		found[0]
	end

	def full?
		storage.length>=capacity 
	end

	def airport_open?
	 	weather.random_weather == "not stormy"
	end
end

	