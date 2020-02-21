class Plane
	def initialize(landed_or_not = true)
		@landed = landed_or_not
	end
	def takes_off
		@landed = false
	end
	def lands
		@landed = true
	end
end