class Plane

	attr_accessor :destination

	def initialize destination
		@flying = true
		@destination = destination
	end

	def flying?
		@flying
	end

	def can_land
		raise 'the plane cannot land if it is not flying' if landed? 
		@flying = false
	end

	def landed?
		!flying?
	end

	def can_take_off
		raise 'the plane cannot take off if it is not landed' if flying?
  	@flying = true
	end

end
