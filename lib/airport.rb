require_relative 'plane'

class Airport

DEFAULT_CAPACITY = 20

attr_reader :weather
attr_reader :capacity

def initialize
	@planes = []
	@capacity = DEFAULT_CAPACITY
end

def weather
@weather = rand(5)
end

def take_off
	fail 'No planes available' if @planes.empty?
	plane = @planes.pop
	#fail 'Stormy, can not take off' if @weather == 4
	plane
end

def land plane
	fail 'Airport is full' if @planes.count >= @capacity
	#fail 'Stormy, can not land' if @weather == 4
	@planes << plane
end
end
