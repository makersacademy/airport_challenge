
class Plane
	attr_reader :landed
	attr_reader :airport

	def initialize
		@landed = false
		@airport = nil
	end

	def land(airport)
		raise "Error: Plane is already landed!" if @landed
		@landed = true
		@airport = airport
	end

	def fly
		raise "Error: Plane is already flying!" if !@landed
		@landed = false
		@airport = nil
	end
end