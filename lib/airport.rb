require_relative 'plane'

class Airport

DEFAULT_CAPACITY = 20

attr_reader :capacity

def initialize
	@planes = []
	@capacity = DEFAULT_CAPACITY
	@weather
end

def weather(n = rand(5))
	if n == 4
		@weather = "stormy"
	else
		@weather = "sunny"
	end
end

def take_off
	fail 'No planes available' if empty?
	fail 'Stormy, can not take off' if @weather == "stormy"
	plane = @planes.pop
	plane
end

def land plane
	fail 'Airport is full' if full?
	fail 'Stormy, can not land' if @weather == "stormy"
	@planes << plane
end
end

public

def empty?
	@planes.empty?
end

def full?
	@planes.count >= @capacity
end
