class Plane

	# Your code should defend against edge cases such as
	# inconsistent states of the system ensuring that planes
	# can only take off from airports they are in; planes
	# that are already flying cannot takes off and/or be in
	# an airport; planes that are landed cannot land again
	# and must be in an airport, etc.

	DEFAULT_FLIGHT_STATUS = true

	attr_accessor :flying

	def initialize(flying = DEFAULT_FLIGHT_STATUS)
		@flying = flying
	end



end
