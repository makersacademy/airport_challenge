class Plane 
  attr_reader :flying

  def initialize(starting_airport, flying = false)
    @starting_airport = starting_airport
    @starting_airport.add_plane(self)
    @flying = flying
  end 
  
  def land(airport)
    raise "Plane already landed" if not flying?
    airport.add_plane(self)
    @flying = false
  end

  def takeoff(airport)
    raise "Plane already flying" if flying?
    raise "Plane at different airport" if airport.planes.include?(self) == false
    airport.remove_plane(self)
    @flying = true
  end

  private 

  def flying?
    @flying ? true : false
  end

end  