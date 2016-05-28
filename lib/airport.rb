class Airport

	DEFAULT_CAPACITY = 20
	CAPACITY_REACHED_ERROR_MESSAGE = "airport full"

	def initialize (capacity = DEFAULT_CAPACITY)
		@capacity = capacity
		@planes = []
	end

	def is_airport?
		true
	end

	def accept_plane?(plane)
		room_for_one_more = room_for_plane? 
		room_for_one_more ? accept(plane) : capacity_reached
		room_for_one_more 
	end

	private

	def room_for_plane?
		@planes.length < @capacity
	end

	def accept(plane)
		@planes << plane
	end

	def capacity_reached
		raise CAPACITY_REACHED_ERROR_MESSAGE
	end

end

class Sky
	def is_airport?
		false
	end
	def accept_plane?(plane)
		true
	end
end