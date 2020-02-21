class Airport
	attr_accessor :capacity, :planes
	DEFAULT_CAPACITY = 20

	def initialize(capacity = DEFAULT_CAPACITY)
		@capacity = capacity
		@planes = []
	end

	def fly_plane(plane)
		if !is_stormy?
			plane.takes_off
			@planes.delete_if { |landed_plane| landed_plane == plane }
			puts "Plane #{plane} has taken off"
		end
	end

	def land_plane(plane)
		if !is_stormy? && !is_full? then @planes << plane end
	end

	private 
	def is_stormy? 
		false
	end
	def is_full?
		true if @planes.length == DEFAULT_CAPACITY
	end
end
