class Plane
	def initialize
		@location = "Flying"
	end

	def location
		@location
	end

	def land airport
		raise "Already Landed" if @location != "Flying"
		if (airport.expecting? self) then
			@location = airport
		else 
			airport.land self
		end
	end

	def take_off
		raise "Already In Flight" if @location == "Flying"
		@location = "Flying"
	end
end