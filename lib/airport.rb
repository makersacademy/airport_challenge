class Airport

	DEFAULT_CAPACITY = 20
	CAPACITY_REACHED_ERROR_MESSAGE = "Airport full! Please try another"

	def is_airport?
		true
	end

	def initialize (capacity = DEFAULT_CAPACITY)
		@capacity = capacity
		@planes = []
	end

	def accept_plane?(plane)
		room_for_plane? 
	end

	def receive_plane(plane)
		room_for_plane? ?  @planes << plane : capacity_reached
	end

	def release_plane(plane)
		@planes.delete(plane)
	end

	private
		def room_for_plane?
			@planes.length < @capacity
		end

		def capacity_reached
			raise CAPACITY_REACHED_ERROR_MESSAGE
		end

end

class Sky #NoAirport Class

	def is_airport?
		false
	end

	def accept_plane?(plane)
		true
	end

	def receive_plane(plane)
	end

	def release_plane(plane)
	end

end