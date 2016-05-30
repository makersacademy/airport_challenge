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
	raise  "Plane is already on the ground" unless plane.flying?
	plane.land
	@planes << plane

end 

def take_off(plane)
	raise "No planes available" if empty?
	raise "Cannot take-off: it is too dangerous to take off in stormy weather" if stormy?
	plane = @planes.pop
	plane.take_off
	plane	
end

private

def full?
	@planes.length >= capacity
end 

   def empty?
	@planes.empty?
   end

	def stormy?
		rand(100) > 95 ? true : false
	end

	def flying?
	plane.flying? ? true : false
	end
end