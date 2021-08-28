require_relative 'plane'

class Airport 

attr_reader :max_limit

	def initialize(max_limit = 5)
		@max_limit = max_limit
		@planes = []
 end 

	 def take_off
	 end 

	 def land_plane(plane)
		fail 'The airport is full' if full?
		@planes << plane
	 end 
	 private

	 attr_reader :planes
	 
		def full?
		 @planes.count >= max_limit
		end
end 