require_relative 'plane.rb'
require_relative 'weather.rb'

class Airport
	attr_reader :planes

	def initialize
		@planes = []
	end

	def land_plane(plane)
		plane.land(self)
		@planes << plane
	end

	def take_off(plane)
		raise "Error: Plane is not at this airport!" if !at_airport?(plane)
		plane.fly
		@planes.delete(plane)
	end

	private

	def at_airport?(plane)
		@planes.each do |p|
			if p == plane
				return true
			end
		end
		return false
	end
end