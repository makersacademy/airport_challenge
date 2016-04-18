require_relative 'plane'

class Airport

attr_reader :planes

def initialize
	@planes = []
end 

def airport_landing(plane)
raise "can't land when on already on land" if plane.flying? == false
raise "can't land when stormy" if stormy?
	plane.land
	@planes << plane 
end

def airport_take_off(plane)
	raise "can't take off when flying" if plane.flying? == true
	raise "can't take off when stormy" if stormy?
	plane.take_off
	@planes.delete(plane)
end

def stormy?
	x = rand(10)
	x == 2 ? true : false
	
	
end

end
