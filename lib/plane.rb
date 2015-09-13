require_relative 'airport'

class Plane

	def initialize(destination)
		@flying = true
		@destination = destination
	end
	def flying?
		@flying
	end
	def can_land
		fail 'Can not land if plane is flying' if landed?
		@flying = false
		true
	end
	def landed?
			!@flying
	end
	def can_take_off
		fail 'Can not take off if plane is not landed' if flying?
		@flying = true
	end
end
