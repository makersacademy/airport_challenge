class AirTrafficController

	attr_writer :weather

	def initialize
		@weather = create_weather
		
	end

	def land_at(airport, plane)
		fail 'It is too stormy to land or take off' if @weather == 'stormy'
		fail "Can't authorize landing! Airport is full" if airport.full?
		fail 'Plane is already landed!' if plane.state == 'landed'
		airport.planes << plane
	end

	def take_off_from(airport, plane)
		fail "Plane is already in the air" if plane.state == 'in_air'
		airport.planes.delete(plane) if airport.planes.include?(plane)
 	end

	private

	def create_weather
		return 'stormy' if rand(9).zero?
		return 'sunny'
	end
	
end

