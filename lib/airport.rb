require_relative 'plane'

class Airport
    attr_reader :planes
    
    def initialize
    	@planes = []
    end	
	
	def landing(plane)
		@planes << plane if plane.landed?
	end	

	def departure(plane)
		@planes.pop if planes.include? plane
	end	

end
