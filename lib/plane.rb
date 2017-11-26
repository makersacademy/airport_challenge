class Plane
	def initialize
		@location = "Flying"
	end

	def location
		@location
	end

	def land airport
		raise "Already Landed" if !flying?
		if (airport.expecting? self) then
			@location = airport
		else 
			airport.land self
		end
	end

	def take_off
		raise "Already In Flight" if flying?
		if (@location.released_for_takeoff? self) then
			@location = "Flying"
		else
			@location.release_for_takeoff self
		end
	end

	private 

	def flying?
		@location == "Flying"
	end
end