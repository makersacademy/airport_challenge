require_relative 'Plane.rb'
require_relative 'Weather.rb'

class Airport

  attr_reader :weather

  def initialize(weather = Weather.new)
    @weather = weather
   @planes = []
  end

  def takeoff
    fail "No planes available" unless @planes.count!= 0
    fail "Too stormy to takeoff" if weather.stormy?
@planes.pop
"Takeoff"
  #@plane
    end






  def land(plane)
    fail "No room to land" if @planes.count == 1
    fail "Too stormy to land" if weather.stormy?
    @planes << plane

  end
end

private

# attr_reader :planes
#
# def empty?
#   planes.empty
# end
#
#
#   # def plane_check
#   # end
# end



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
