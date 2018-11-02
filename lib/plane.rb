class Plane
	def land_at_airport (airport)
		airport.planes_present << self
	end

	def takeoff_from_airport (airport)
	end
end