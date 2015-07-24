
class Plane

def initialize
 	@flying = true
end	


def flying?
	@flying
end

def land
	@flying == false
	landed?
end

def landed?
	@flying = false
	true
end

def take_off
	@flying = true
end

end
