class Airport
#
#   # def plane_land(plane)
#   #   # Use an instance variable to store the plane
#   #   # in the 'state' of this instance
#   #   @plane = plane
#   # end
#   #
#   # def plane
#   #   @plane
#   # end
#
#   def weather_stormy
#
#   end
#

  def plane_land(plane)
    fail 'airport is full' if @plane
    @plane = plane
  end


end
