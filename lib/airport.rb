require_relative 'plane'

class Airport

	DEFAULT_CAPACITY = 10

	attr_reader :capacity

	def initialize(capacity = DEFAULT_CAPACITY)
		@capacity = capacity
		@planes = Array.new
		
	end


def land(plane)
	raise "Cannot land: airport is full" if full? 
	raise "Cannot land: it is too dangerous to land in stormy weather" if stormy?
	# raise  "Plane is already on the ground" unless flying?
	@planes << plane
	p "Plane has landed"
end 

def take_off(plane)
	raise "No planes available" if empty?
	raise "Cannot take-off: it is too dangerous to land in stormy weather" if stormy?
	plane = @planes.pop
	return plane
	p "Plane has taken off"
end


private

	def full?
	@planes.length >= capacity
	end 

	def empty?
	@planes.empty?
	end 

	def stormy?
		if rand(100) > 95 then
			return true
		else false
		end 
	end 
end 