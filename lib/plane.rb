
class Plane
	attr_reader :landed
	attr_reader :airport

	def initialize
		@landed = false
		@airport = nil
	end

	def land(airport)
		@landed = true
		@airport = airport
	end

	def fly
		@landed = false
		@airport = nil
	end
end