require_relative 'plane'

class Airport

	def initialize
		@planes = []
	end

#def initialize
#@forecast = ['stormy','sunny']
#end

	def land plane
#raise 'Weather stormy, proceed to alternate airport' if stormy?
		raise 'Airport full, remain in stack' if full?
		@planes << plane
		plane.land
	end

	def takeoff plane
		@planes.pop
		plane.takeoff
	end

#def stormy?
#	@forecast.sample == 'stormy'
#end

private

	def full?
		@planes.count >= 7
	end

	end









