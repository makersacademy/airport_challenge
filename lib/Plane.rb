class Plane
	attr_reader :landed_at, :state

	def land(airport)
		@landed_at = airport
		@state = 'landed'
	end

	def take_off
		@landed_at = nil
		@state = 'in_air'
	end
end