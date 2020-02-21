class Airport
	attr_accessor :capacity, :planes
	DEFAULT_CAPACITY = 20

	def initialize(capacity = DEFAULT_CAPACITY)
		@capacity = capacity
		@planes = []
	end

	def fly_plane(plane)
		if !has_plane?(plane)
			raise StandardError, "This plane is not at the airport"
		elsif !is_stormy? 
			plane.takes_off
			@planes.delete_if { |landed_plane| landed_plane == plane }
			"Plane #{plane} has taken off"
		end
	end

	def land_plane(plane)
		if is_full?
			raise StandardError, 'No parking space available'
		elsif !is_stormy? 
		  @planes << plane 
		end
	end

	private 
	def is_stormy? 
		false
	end
	def is_full?
		true if @planes.length == DEFAULT_CAPACITY
	end
	def has_plane?(plane)
		true if @planes.include? plane
	end
end
