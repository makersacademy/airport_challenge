class Plane
	def land_at_airport (airport, weather)
		if weather = "sunny"
			airport.planes_present << self
		else
			raise "Danger stormy weather"
		end
	end

	def takeoff_from_airport (airport, weather)
		if weather == "sunny"
			airport.confirm_departure(self)
		else
			raise "Danger stormy weather"
		end
	end
end