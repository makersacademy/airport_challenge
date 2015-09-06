require '~/projects/airport_challenge/lib/plane.rb'

class Airport
	
	def initialize
		@planes = []
	end

	def take_off
		fail 'No planes at airport' if @planes.empty?
		@planes.pop
	end

	def land plane
		fail 'Airport is full' if @planes.count >= 20
		@planes << plane
	end
end
