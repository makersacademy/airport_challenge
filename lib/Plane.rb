class Plane

	attr_reader :status
	attr_reader :airport

	def initialize(status = "airborne", airport = nil)
		@status = status
		@airport = airport
	end

	def set_landed(airport)
		@status = "landed"
		@airport = airport
	end

	def set_airborne
		@status = "airborne"
		@airport = nil
	end

end