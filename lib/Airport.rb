require_relative 'Plane.rb'

class Airport

  def takeoff
    fail "No planes available" unless @plane
    @plane
    

  end

  def land(plane)
    @plane = plane
  end

  # def plane_check
  # end
end



# class Airport
#
#   def land(plane)
#    "Plane landed"
#   end
#
#   def takeoff(plane)
#     Plane.new
#     "Plane has takenoff, no longer in the airport"
#   end
#
#
#
# end
