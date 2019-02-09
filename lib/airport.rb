class Airport
attr_reader :weather
attr_reader :planes_in_airport

 def initialize(weather)
   @weather = weather
   @planes_in_airport = []
 end

def land(plane)
  @planes_in_airport.push(plane)
end

def take_off(plane)
  index = @planes_in_airport.index{|item| item == plane}
  take_off_plane = @planes_in_airport.delete_at(index)
  #return plane = take_off_plane
end

def report(plane)
  return !@planes_in_airport.include?(plane)
end

def weather
  if @weather == "stormy"
  raise "The plane cannot take off due to stormy weather condidtions."
  else
    airport = Airport.new
    expect(airport.take_off(plane)).to eq true
  end
end

end
