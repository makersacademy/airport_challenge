class Plane
	attr_accessor  :takeoff, :grounded
	def initialize(status = false, takeoff = false) 
		@grounded = status
		@takeoff = takeoff
	end

end		
