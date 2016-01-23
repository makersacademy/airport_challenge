require 'plane'
class Airport
	attr_accessor :planes
	def initialize 
    @planes = []
	end

	def land(plane)
	@planes << plane	
	end

	def depart(plane)
	raise "unsafe flying conditions" if stormy?	
	@planes.delete(plane)	
	end

	def stormy?
		false
	end

end