class Plane
	def land_at_airport (airport, weather)
		raise "Danger stormy weather" if weather == "stormy"
		raise "Danger airport full" if airport.full?
		airport.planes_present << self
	end

	def takeoff_from_airport (airport, weather)
		if weather == "sunny"
			airport.confirm_departure(self)
		else
			raise "Danger stormy weather"
		end
	end
end