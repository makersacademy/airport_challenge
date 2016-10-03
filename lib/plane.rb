class Plane

	attr_accessor :flying

	def land
		raise 'Plane already landed!' if flying? == false
		@flying = false
	end

	def take_off
		raise 'Plane already in the air!' if flying?
		@flying = true
	end

	def flying?
		@flying
	end

end