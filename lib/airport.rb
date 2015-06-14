require 'plane'

class Airport
	DEFAULT_CAPACITY = 20

attr_reader :capacity 
attr_reader :landed_planes

def initialize 
 @capacity = DEFAULT_CAPACITY
 @landed_planes = []	
end

def land plane
	fail "Airport is full" if full?
	landed_planes << plane
end

def take_off plane
	fail 'No planes to take off' if empty?
	landed_planes.delete plane 
end

end

private

def full?
	landed_planes.count >= capacity
end

def empty?
	landed_planes == []
end
