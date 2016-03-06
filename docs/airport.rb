require_relative 'weather'

class Airport

DEFAULT_CAPACITY = 50

attr_reader :capacity, :storage

	def initialize(capacity=DEFAULT_CAPACITY)
		@capacity = capacity
		@storage = []
		@weather = Weather.new
	end

	def full?
		storage.length>=capacity 
	end

	def in_airport?(plane)
		storage.include?(plane)
	end

	def airport_open?
	 	weather.random_weather == "not stormy"
	end

	def accepts_plane(plane)
		if airport_open?
			if full?
				fail 'This airport is full. Do not land.' 
			elsif plane.plane_status == false
				fail 'This plane is already at an airport.'
			else	
			 storage << plane 
			 plane.landed
			end
		else
			announcement
		end
	end

	def releases_plane(plane)
		if airport_open?
			if plane.plane_status
				fail 'This plane is already in the air, so it cannot take off.'
			elsif in_airport?(plane) == false
				fail 'This plane is not at this airport, so it cannot take off from here.'
			else	
			 storage.delete(plane)
			 plane.flying
			end
		else
			announcement
		end
	end

	def plane_location(plane)
		if plane.plane_status
			'This plane is flying.'
		else
			find_plane(plane)
		end
	end

	def all_planes
		ObjectSpace.each_object(Plane).to_a
	end

	private 

	attr_reader :weather

	def announcement
		"Due to stormy weather, this airport is closed." 
	end

	def find_plane(plane)
		airports = ObjectSpace.each_object(Airport).to_a
		found =	airports.select do | airport |
			airport.in_airport?(plane)
		end
		found[0]
	end
end

	