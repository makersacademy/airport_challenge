class Plane
	attr_accessor :is_flying

	def initialize
		@is_flying = true
	end

	def land_at_airport (airport, weather)
		raise "Plane is already landed!" if is_flying == false
		raise "Danger stormy weather" if weather == "stormy"
		raise "Danger airport full" if airport.full?
		self.is_flying = false
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