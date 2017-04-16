class Plane

attr_accessor :flying

def initialize
	@flying = true
end 

def flying?
	@flying ? true : false
end 

def land
	@flying = false
	return self
end 
def take_off
	@flying = true
	return self
end

end