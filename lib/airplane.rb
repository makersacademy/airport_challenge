class Airplane
	attr_reader :in_flight

	def initalize(in_flight=true)
		@in_flight = in_flight
	end

	def land
		raise "Can't land, already landed!" unless in_flight?
 		update_in_flight(false)
    "Airplane has landed"
	end

	def take_off
		raise "Can't take off, already airborne!" if in_flight?
    update_in_flight(true)
    "Airplane has taken off"
	end

	private

	def in_flight?
		self.in_flight

	end

	def update_in_flight(status)
		@in_flight
	end
end
