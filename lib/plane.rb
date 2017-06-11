class Plane
	
	attr_accessor :status
	
	def initialize	
		@status = "Landed"
	end
	
	def land
		self.status = "Landed"
		self
	end 

	def take_off
		self.status = "Flying"
		self
	end 
end
