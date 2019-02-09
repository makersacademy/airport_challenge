class Airport
attr_accessor :weather
attr_reader :planes_in_airport

 def initialize(weather)

   @weather = weather
   @planes_in_airport = []
 end

def land(plane)
  if @weather == "clear"
     @planes_in_airport.push(plane)
  end
end

def take_off(plane)
  if @weather == "clear"
    index = @planes_in_airport.index{|item| item == plane}
    take_off_plane = @planes_in_airport.delete_at(index)
  end
end

def report(plane)
  return !@planes_in_airport.include?(plane)
end

#
end
