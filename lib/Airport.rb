require_relative 'Plane.rb'
require_relative 'Weather.rb'

class Airport
  DEFAULT_CAPACITY = 40

  attr_reader :weather
  attr_accessor :capacity

  def initialize(weather = Weather.new, capacity = DEFAULT_CAPACITY)
    @weather = weather
   @planes = []
  @capacity = capacity
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

  def capacity
@capacity
  end


private

attr_reader :planes

def empty?
  planes.count == 0
end

def full?
  planes.count >= capacity
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
