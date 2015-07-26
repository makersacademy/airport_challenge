class Plane

	def initialize 
		@flying = true
	end

	def flying? #Method used to define the status of a plane (flying or not flying)
		 @flying
	end

	def landed? #Method that state that the plane is not flying
		subject = false
		@flying = false
	end

	def departed?#Method that state that the plane is flying
		subject = true
		@flying = true
	end



end
