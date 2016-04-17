require_relative 'plane'

class Airport
	DEFAULT_CAPACITY = 20
    attr_reader :planes, :capacity
    
    def initialize(capacity = DEFAULT_CAPACITY)
    	@planes = []
    	@capacity = capacity
    end	
	
	def landing(plane)
		raise "Airport is full" if full?
		@planes << plane if plane.landed?
	end	

	def departure(plane)
		@planes.pop if planes.include? plane
	end	

	private

	def full?
		@planes.count >= capacity
	end	

end
