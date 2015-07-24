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
	end 

	def allow_landing
		@allowlanding = true
	end 

end
