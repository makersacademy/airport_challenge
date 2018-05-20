class Plane

	DEFAULT_FLIGHT_STATUS = true

	attr_accessor :flying

	def initialize(flying = DEFAULT_FLIGHT_STATUS)
  		@flying = flying
  	end

end
