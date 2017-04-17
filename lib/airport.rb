require_relative 'plane.rb'
require_relative 'weather.rb'

class Airport
	attr_reader :planes

	def initialize
		@planes = []
		@weather = Weather.new
	end

	def land_plane(plane)
		raise "Error: Weather is too stormy to land!" if !good_weather?
		plane.land(self)
		@planes << plane
	end

	def take_off(plane)
		raise "Error: Plane is not at this airport!" if !at_airport?(plane)
		raise "Error: Weather is too stormy to take off!" if !good_weather?
		plane.fly
		@planes.delete(plane)
	end

	private

	def good_weather?
		return false if @weather.weather? == "stormy"
		return true
	end

	def at_airport?(plane)
		@planes.each do |p|
			if p == plane
				return true
			end
		end
		return false
	end
end