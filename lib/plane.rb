class Plane
  
	def initialize
		@flying = true
	end

	def land
		raise "Plane is already grounded" if flying == false
		@flying = false
	end

	def take_off
		raise "Plane is already in the air" if flying == true
		@flying = true
	end

private
attr_reader :flying

end