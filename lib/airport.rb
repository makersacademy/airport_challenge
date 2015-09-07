
require_relative 'plane'

DEFAULT_CAPACITY = 20
class Airport

attr_reader :capacity 

def initialize 
	@airport
	@planes = []
	@capacity = DEFAULT_CAPACITY
end 

def take_off_plane
	'plane flying'
	@planes.pop
end

def land_plane(plane)
	'plane landed'
	fail 'Airport is full.' if full?
	@planes << @plane
end

private 

attr_reader :planes 

def full?
	planes.count >= capacity
end

def stormy?

end


end
