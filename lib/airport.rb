require 'plane.rb'

class Airport 

	attr_reader = :hangar

	def initialize
		@hangar = [Plane.new]	
	end

	def land
		@hangar << Plane
	end

	def takeoff
		var = @hangar[0].to_s.chars[-5..-2].join.upcase!
		p "ATC: Flight #{var} has successfully taken off"
		@hangar.pop
	end

end
