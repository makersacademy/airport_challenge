
#attr_reader :airport, :plane


require_relative './plane.rb'
class Airport
attr_reader :capacity
DEFAULT_CAPACITY = 10
#this is where defauly capacity goes
def initialize(capacity=DEFAULT_CAPACITY)
 @capacity = capacity
 @plane = []
end

#def weather_random
#  rand(1..8)
#end

def weather_land
  raise "Too stormy!" if stormy?
  plane

end

def weather_takeoff
  raise "Too stormy to take off" if stormy?
  plane
 return "Plane can take off"
end


def land(plane)
  fail "airport is fullzzzz" if full?
  @plane << plane
  #plane = plane
 return "plane has landed"
end

private
attr_reader :plane
def full?
  plane.count >= @capacity
 end

 def stormy?
   rand(1..8)>=2
 end
end
