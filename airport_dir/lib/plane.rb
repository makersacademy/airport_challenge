require_relative 'airport'
require_relative 'weather'
class Plane
  include Weather
  def initialize(airport)
    @airplane_state = "Landed"
    airport.airport_hanger.push(self)
    @current_airport = airport
  end

  def takeoff
   if good_weather == true
     @airplane_state = "Flying"
     @current_airport.airport_hanger.delete(self)
   else
     raise "Weather is too stormy to fly"
   end
  end

  def land_plane(airport)
    if airport.airport_hanger.count < airport.capacity
      @airplane_state = "Landed"
      airport.airport_hanger.push(self)
    else
      raise "The airport is full"
    end
  end

end
