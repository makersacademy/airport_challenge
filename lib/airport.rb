require './lib/plane'
class Airport
	attr_accessor :planes, :capacity
	def initialize
    @planes = []
    @capacity = 10
	end

	def land(plane)
	fail "plane is already landed and cannot land" if @planes.include?(plane)==true
	fail "unsafe flying conditions to land" if stormy?
	fail "airport at capacity" if @planes.size >=@capacity
	plane.flying=false
	@planes << plane	
	end

	def depart(plane)
	fail "plane is already flying an cannot take off" if plane.flying == true
	fail "unsafe flying conditions to depart" if stormy?
	fail "plane can only take off from airports it is in" if @planes.include?(plane)==false
	@planes.delete(plane)	
	plane.flying=true
	end

	def stormy?
	if rand(10).even? 
		false
	else 
		true
	end
	

	end

	
end