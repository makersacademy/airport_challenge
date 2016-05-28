class Plane

	def at_airport?
		@at_airport == true ? true : false
	end

	def land
		@at_airport = true
	end

	def take_off
		@at_airport = false
	end

end