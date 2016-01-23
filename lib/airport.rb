require 'plane'
class Airport
	attr_accessor :planes, :capacity
	def initialize
    @planes = []
    @capacity = 10
	end

	def land(plane)
	raise "unsafe flying conditions to land" if stormy?
	raise "airport at capacity" if @planes.size >=@capacity
	@planes << plane	
	end

	def depart(plane)
	raise "unsafe flying conditions to depart" if stormy?	
	@planes.delete(plane)	
	end

	def stormy?
	if rand(10).even? 
		false
	else 
		true
	end
	

	end

	
end