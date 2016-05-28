class Airport

	DEFAULT_CAPACITY = 20
	CAPACITY_REACHED_ERROR_MESSAGE = "airport full"

	def initialize (capacity = DEFAULT_CAPACITY)
		@capacity = capacity
		@planes = []
	end

	def land_plane?(plane)
		room_for_one_more = room_for_plane? 
		room_for_one_more ? dock(plane) : capacity_reached
		room_for_one_more 
	end

	private
	
	def room_for_plane?
		@planes.length < @capacity
	end

	def dock(plane)
		@planes << plane
	end

	def capacity_reached
		raise CAPACITY_REACHED_ERROR_MESSAGE
	end

end