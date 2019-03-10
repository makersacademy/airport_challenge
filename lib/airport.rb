class Airport
	attr_reader :hangar

	def initialize
		@hangar = []
	end

	def land(airplane)
		hangar << airplane
	end
end