require_relative 'plane'

class Airport

def land(plane)
	plane.landed = true
	@planes << plane
end

def landed
	@plane.landed
end

def takeoff(plane)
	plane.takenoff = true
end



end
