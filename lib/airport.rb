class Airport

	def initialize
		@hangar = []
		@stormy = false
    end

	def allow_landing(plane)
		fail "It is too dangerous to land due to weather conditions!" if stormy?
		plane.land
		@hangar << plane
	end

	def allow_take_off
		fail ("The hangar is empty!!") if @hangar.empty?
		fail "It is too dangerous to take off due to weather conditions!" if stormy?
		plane = @hangar.pop
		plane.take_off
		plane
	end

	def stormy?
		rand(10) > 8 ? true : false
	end


end