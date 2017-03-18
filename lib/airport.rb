require_relative "plane"

class Airport

	attr_reader :plane

	def allow_landing(plane)
	  plane
	end

    def confirm_landing(plane)
	  plane	
	end	

	def allow_takeoff(plane)
	  plane	
	end
end