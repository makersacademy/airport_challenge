require 'plane'
class Airport
	attr_accessor :planes
	def initialize 
    @planes = []
	end

	def land(plane)
	raise "unsafe flying conditions to land" if stormy?
	@planes << plane	
	end

	def depart(plane)
	raise "unsafe flying conditions to depart" if stormy?	
	@planes.delete(plane)	
	end

	def stormy?
		false
	end

end