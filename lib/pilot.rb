class Pilot

	attr_reader :permission_to_land, :plane

	def initialize(plane = Plane.new)
		@permission_to_land = false
		@plane = plane
	end

	def request_to_land(airport)
		if airport.traffic_controller.grant_permission?(self)
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
end