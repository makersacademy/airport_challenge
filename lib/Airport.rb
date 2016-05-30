require_relative 'Plane'
class Airport

	attr_reader :bikes, :capacity

	DEFAULT_CAPACITY = 20


	def initialize(capacity=DEFAULT_CAPACITY)
		plane = Plane.new
		@planes = []
		@capacity = capacity
	end 


	def land(plane)
		#raise "Airport full!" if full?
		#raise "Too stormy to land!" if weather == "stormy"
		@planes << plane #if (!full? && weather == "sunny")
		
	end

	def takeoff(plane)
		#raise "Too stormy to take off" if weather == "stormy"
		plane.takeoff
		@planes.pop
		"#{plane} is taking off!"
	end


	#private
	
	#def full?
	#	true if @planes.length >= @capacity
	#end

end 