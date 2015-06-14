class Plane
	FLYING_STATE='flying'
	LANDED_STATE='landed'

	attr_reader :state

	def initialize
		@state = FLYING_STATE
	end

	def land
		fail 'Plane is already landed' if landed?
		@state = LANDED_STATE
	end

	def take_off
		fail 'Plane is already flying' if flying?
		@state = FLYING_STATE
	end

	def flying?
		@state == FLYING_STATE
	end

	def landed?
		@state == LANDED_STATE
	end
end
