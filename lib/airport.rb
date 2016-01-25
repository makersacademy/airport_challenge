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
	@plane = plane 
	fail "plane is already landed and cannot land" if include?
	fail "unsafe flying conditions to land" if stormy?
	fail "airport at capacity" if at_capacity
	plane.flying=false
	store_plane
	end

	def depart(plane)
	@plane = plane 
	fail "plane is already flying an cannot take off" if plane.flying
	fail "unsafe flying conditions to depart" if stormy?
	fail "can only take off from current airport" if !include?	
	plane.flying=true
	delete_plane
	end
	
	def increase_capacity(number)
	@capacity = number
	end
	
private

	def include?
	planes.include?(@plane)
	end

	def store_plane
	planes << @plane	
	end

	def delete_plane
	planes.delete(@plane)	
	end

	def at_capacity
	planes.size >= capacity
	end

end