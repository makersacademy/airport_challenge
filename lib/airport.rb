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
	raise "plane is already flying an cannot take off" if plane.flying == true
	raise "unsafe flying conditions to depart" if stormy?
	raise "plane can only take off from airports it is in" if @planes.include?(plane)==false
	plane.flying=true
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