class Airport
	attr_accessor :planes_present
	def initialize
		@planes_present = []
	end

	def confirm_departure (plane)
		planes_present.delete(plane)
	end
end