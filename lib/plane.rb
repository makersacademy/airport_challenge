class Plane
	
	def initialize 
		@landed = true
	end 

	def land airport
		@airport = airport
		landed?
	end

	def location
		@airport
	end

	def landed?
		@landed
	end

	def take_off airport
		@airport = airport
		@landed = false
	end




end
