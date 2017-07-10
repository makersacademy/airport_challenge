require_relative 'plane'

	class Airport

	def land(plane)
		plane.landed = true
		@planes << plane
	end

	def landed
		@plane.landed
	end

	def takeoff(plane)
		plane.takenoff = true
	end

	def stormy?
		the_weather = (1..10).to_a
		return the_weather.sample
		stormy =1
	end
	
end
