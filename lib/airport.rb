require '~/projects/airport_challenge/lib/plane.rb'

class Airport
	
	attr_reader :planes

	def initialize
		@planes = []
	end

	def take_off
		fail 'No planes at airport' if planes.empty?
		planes.pop
	end

	def show_hanger
		planes
	end

	def land plane
		fail 'Airport is full' if @planes.count >= 20
		planes << plane
	end
end
