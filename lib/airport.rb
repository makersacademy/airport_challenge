#require './lib/plane.rb'

class Airport
attr_accessor :weather
attr_reader :planes_in_airport
attr_reader :capacity

 def initialize(capacity=20)
   @capacity = capacity
   @planes_in_airport = []
   weather_man
 end

def weather_man
  weather_num = rand(0..100)
  if weather_num <=80
      @weather = "sunny"
  else
      @weather = "stormy"
  end
  @weather
end

def land(plane)
  weather_man
  if @weather == "sunny" && @planes_in_airport.count < capacity && report(plane) == true
     @planes_in_airport.push(plane)
     plane.allow
  end
end

def take_off(plane)
  weather_man
  if @weather == "sunny" && report(plane) == false
    index = @planes_in_airport.index{|item| item == plane}
    take_off_plane = @planes_in_airport.delete_at(index)
    plane.allow
  end
end

#reports if plane is not in airport
def report(plane)
  return !@planes_in_airport.include?(plane)
end

def communicate(plane)
  request = plane.get_request
  if request == "take off"
    take_off(plane)
  elsif request == "land"
    land(plane)
  end
end
#
end
