class Plane

	def initialize 
		@flying = true
	end

	def flying? #Method used to define the status of a plane (flying or not flying)
		 if @flying == false 
		 	false
		 else
		 	true
		 end
	end

	def landed?
		@flying = false
	end


end
