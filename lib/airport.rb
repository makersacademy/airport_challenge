require './lib/plane'
require './lib/weather'
class Airport
	include Weather
	attr_accessor :planes
	attr_reader :capacity
	
	DEFAULT_CAPACITY = 10
	def initialize (capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
	end

	def land(plane)
	fail "plane is already landed and cannot land" if planes.include?(plane)==true
	fail "unsafe flying conditions to land" if stormy?
	fail "airport at capacity" if planes.size >= capacity
	plane.flying=false
	planes << plane	
	end

	def depart(plane)
	fail "plane is already flying an cannot take off" if plane.flying == true
	fail "unsafe flying conditions to depart" if stormy?
	fail "can only take off from current airport" if planes.include?(plane)==false
	planes.delete(plane)	
	plane.flying=true
	end
	
	def increase_capacity(number)
	@capacity = number
	end
	
end