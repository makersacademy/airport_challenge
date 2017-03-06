class Plane 

	attr_reader :airborne

	def initialize
		@airborne = true
	end

	def in_air
		@airborne = true
	end

	def on_ground
		@airborne = false
	end
end