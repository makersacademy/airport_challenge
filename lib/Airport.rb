require_relative 'Plane.rb'
require_relative 'Weather.rb'

class Airport

  attr_reader :weather

  def initialize(weather = Weather.new)
    @weather = weather
  end

  def takeoff
    fail "No planes available" unless @plane
"Takeoff"
  #@plane
    end






  def land(plane)
    fail "No room to land" if @plane
    fail "Too stormy to land" if weather.stormy?
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
