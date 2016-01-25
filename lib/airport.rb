require_relative 'plane'


class Airport

	def initialize
		@planes = []
	end

	def land(plane)  #rspec tested
		@planes << plane
	end

	def planes_landed  #rspec tested
		@planes
	end

	def planes_takenoff
		@planes.pop
	end
end

# to access @planes --> need another method planes_landed, why can't return value in land method?  


















