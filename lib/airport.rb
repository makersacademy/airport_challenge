require_relative 'plane'
require_relative 'weather'

class Airport

	DEFAULT_CAPACITY=20
	

	attr_accessor :planes
	attr_reader :capacity

	def initialize
		@planes=[]
		@capacity=DEFAULT_CAPACITY
	end

	def land_plane plane, weather=Weather.new
		fail "Airport Full" if full?
		return "The storm has made it impossible to land" if weather.Stormy?
		plane.land 
		planes << plane 

	end

	def take_off weather=Weather.new
		fail "There are no Planes" if empty?
		return "The Weather is too stormy to take off" if weather.Stormy?
		planes.last.take_off
		planes.pop
	end

	def full?
		planes.count >= capacity
	end

	def empty?
		planes.count == 0
	end

end