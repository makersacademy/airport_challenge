class Plane 
  attr_reader :flying

  def initialize(starting_airport, flying = false)
    @starting_airport = starting_airport
    @starting_airport.add_plane(self)
    @flying = flying
  end 
  
  def land(airport, weather = airport.weather)
    raise "Plane already landed" unless flying?
    raise "Weather stormy cannot land" if weather.stormy?
    airport.add_plane(self)
    @flying = false
  end

  def takeoff(airport, weather = airport.weather)
    raise "Plane already flying" if flying?
    raise "Plane at different airport" unless airport.plane_at_airport?(self)
    raise "Weather stormy cannot take off" if weather.stormy?
    airport.remove_plane(self)
    @flying = true
  end

  private 

  def flying?
    @flying ? true : false
  end

end
