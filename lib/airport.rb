require_relative 'plane'

class Airport
	def initialize
		@planes = []
		@allowtakeoff = false
		@allowlanding = false
	end 

	def allow_take_off
		@allowtakeoff = true
	end 

	def release plane
		@planes.pop
		plane.take_off
	end 

	def allow_landing
		@allowlanding = true
	end

	def receive plane
		plane.land
		@planes << plane

	end 
end
