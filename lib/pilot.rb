class Pilot

	attr_reader :plane
	attr_accessor :permission_to_land, :permission_to_take_off

	def initialize(plane = Plane.new)
		@permission_to_land = false
		@permission_to_take_off = false
		@plane = plane
	end

	def request_to_land(airport)
		if airport.traffic_controller.grant_permission_to_land?(self)
			@permission_to_land = true
		else 
			fail "Permission to land denied"
		end
	end

	def permission_to_land?
		@permission_to_land
	end

	def land_plane(airport)
		if permission_to_land?
			self.plane.land(airport)
		else
			fail "Get permission to land first!"
		end
	end

	def request_to_take_off(destination)
		if self.plane.location.traffic_controller.grant_permission_to_take_off?(self)
			@permission_to_take_off = true
		else
			fail "Permission to take off denied"
		end
	end

	def take_off(destination)
		self.plane.take_off(destination)
	end
end