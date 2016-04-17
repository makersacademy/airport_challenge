require_relative 'plane'

class Airport
    attr_reader :planes
    
    def initialize
    	@planes = []
    end	
	
	def landing(plane)
		if plane.landed?
		 @planes << plane
		end 
	end	

	def departure(plane)
		if planes.include? plane
			@planes.pop
		end	
	end	

end
