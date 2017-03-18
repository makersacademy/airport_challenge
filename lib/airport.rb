require_relative "plane"

class Airport

	attr_reader :plane

	def grant_landing_permission(plane)
	  plane
	end

    def confirm_landing(plane)
	  plane	
	end	

	def grant_takeoff_permission(plane)
	  plane	
	end
end