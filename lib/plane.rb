class Plane

attr_accessor :flying

def initialize
	@flying = true
end 

def flying?
	@flying ? true : false
end 

def landed?
	@flying = false
	return self
end

end