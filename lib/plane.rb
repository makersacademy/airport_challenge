class Plane

	def initialize(destination)
		@flying = true
		@destination = destination
	end

	def flying?
		@flying
	end

	def land
		fail 'Can not land if plane is not flying' if landed?
		@flying = false
	end

	def landed?
			!@flying
	end

	def take_off
		fail 'Can not take off if plane is already flying' if flying?
		@flying = true
	end
end
