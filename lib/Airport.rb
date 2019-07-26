require_relative 'Plane.rb'
require_relative 'Weather.rb'

class Airport

  attr_reader :weather

  def initialize(weather = Weather.new)
    @weather = weather
   @planes = []
  end

  def takeoff
    fail "No planes available" if empty?
    raise "Too stormy to takeoff" unless !weather.stormy?
@planes.pop
"Takeoff"
  #@plane
    end






  def land(plane)
    fail "No room to land" if full?
    fail "Too stormy to land" if weather.stormy?
    @planes << plane

  end


private

attr_reader :planes

def empty?
  planes.count == 0
end

def full?
  planes.count >= 1
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
