class Plane
	attr_reader :landed, :takeoff

	def land
		@landed = true
	end

	def takeoff
		@landed = false
	end
end