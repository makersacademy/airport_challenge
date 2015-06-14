class Plane

attr_reader

def initialize
	@flying = true
end



private 


def flying?
	@flying
end

def landed?
	!@flying
end
