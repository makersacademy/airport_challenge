require_relative 'plane'
require_relative "weather"

class Airport

  attr_reader :planes_parking

  def initialize 
    @planes_parking = []
    @weather1 = Weather.new
  end 

  def release_plane
    plane1 = Plane.new
  end

  def land(plane)
    @planes_parking.push(plane)
    "Plane has landed"
  end

  def not_safe_to_land(plane)
    @planes_parking.push(plane)
    "Warning! Bad weather, do not land plane"
  end

  def depart(plane)
    @planes_parking.delete(plane)
    "Plane no longer in airport"
  end

  # code not working for stormy weather - why does it land plane? 
  def weather_outlook
    plane1 = release_plane
    if @weather1.conditions(0) 
      land(plane1)
    elsif @weather1.conditions(1)
      land(plane1)    
    elsif @weather1.conditions(2)
      land(plane1)     
    elsif @weather1.conditions(3) 
      not_safe_to_land(plane1)
    else
      "weather unknown - do not land"
      end      
  end 

end 

airport = Airport.new
plane1 = airport.release_plane
p airport.land(plane1)
p airport.depart(plane1)
p airport.weather_outlook
p airport.planes_parking


