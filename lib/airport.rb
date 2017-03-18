require_relative "plane"

class Airport

	def grant_landing_permission(plane)
	  @plane = plane
	end

    def confirm_landing(plane)
	  plane	
	end	
end