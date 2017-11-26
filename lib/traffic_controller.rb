require 'weather'
require 'airport'

class TrafficController
  def land_to(plane, airport)
    if weather.stormy?
      'It is too windy and stormy out there'
    elsif plane.landed?
      'This plane is already landed here'
    else
      plane.land
      airport.add_plane(plane)
    end
  end

  def takeoff_from(plane, airport)
    if weather.stormy?
      'It is too windy and stormy out there'
    elsif plane.flying?
      'The plane has already left the airport'
    elsif airport.empty?
      "The airport is empty"
    elsif airport != plane.current_airport
      "The plane is not in this airport"
    else
      plane.fly
      airport.remove_plane
    end
  end

  def assign_plane_to_airport(plane, airport)
    plane.assigned_airport(airport)
  end

  def weather
    Weather.new
  end
end
