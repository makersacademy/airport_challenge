class Plane 

  def initialize(starting_airport)
    @starting_airport = starting_airport
    @starting_airport.add_plane(self)
  end 
  
  
  def land(airport)
    airport.add_plane(self)
  end

  def takeoff(airport)
    airport.remove_plane(self)
  end
end  