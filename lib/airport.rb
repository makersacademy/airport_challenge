require_relative 'plane'

class Airport 

attr_reader :default_capacity

	def initialize(default_capacity = 5)
		@default_capacity = default_capacity
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
		 @planes.count >= default_capacity
		end
end 