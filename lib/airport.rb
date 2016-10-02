class Airport
	
	attr_accessor :landed_planes

	def initialize
		@landed_planes = []
	end

	def full?
		true if @landed_planes.count >= 20
	end

end