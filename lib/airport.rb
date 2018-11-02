class Airport
	attr_accessor :planes_present, :capacity
	DEFAULT_CAPACITY = 15
	def initialize (capacity = DEFAULT_CAPACITY)
		@planes_present = []
		@capacity = capacity

	end

	def confirm_departure (plane)
		planes_present.delete(plane)
	end

	def full?
		planes_present.length == capacity ? true : false
	end
end