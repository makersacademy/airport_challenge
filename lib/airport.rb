class Airport
	attr_reader :hangar

	def initialize
		@hangar = []
	end

	def land(airplane)
		hangar << airplane
	end

	def take_off(airplane) 
		hangar.delete(airplane)
	end
end