require_relative 'plane'

class Airport
	attr_reader :planes 
	attr_accessor :stormy

	def initialize
		@planes = []
		@stormy = false
		self.weather
	end

	def land_plane(this_plane)
		raise "Stormy Weather - All operations ceased" if stormy?
		this_plane.land
		planes << this_plane
	end

	def fly_plane(this_plane)
		raise "Stormy Weather - All operations ceased" if stormy?
		this_plane.fly
		planes.pop
	end

	def weather
		forecast = Random.new
		result = forecast.rand(100)
		ground_planes(result)
	end

	def ground_planes(result)
		if result >= 80
			@stormy = true
		else
			@stormy = false
		end
	end

	def stormy?
		@stormy
	end

end