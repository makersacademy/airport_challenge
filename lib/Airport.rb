require_relative 'plane'

class Airport

	DEFAULT_CAPACITY = 20

	attr_reader :capacity

	def initialize(capacity = DEFAULT_CAPACITY)
		@capacity = capacity
		@planes = []
		
	end


def land(plane)
	raise "Airport is full" if full? 
	raise "Too stormy to land" if stormy?
	raise  "Plane is already on the ground" unless plane.flying?
	plane.land
	@planes << plane

end 

def take_off(plane)
	raise "No planes available" if empty? && !stormy?
	raise "Too stormy to take off" if stormy?
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

   #randomizing stormy weather on a scale of 10

	def stormy?
		rand(10) > 8 ? true : false
	end

	def flying?
	plane.flying? ? true : false
	end
end