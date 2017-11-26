require "weather"
require "airport"

class TrafficController
  def land_to(plane, airport)
    if weather.stormy?
      "It is too windy and stormy out there"
    elsif plane.landed?
      "This plane is already landed here"
    else
      plane.land
      airport.add_plane(plane)
    end
  end

  def takeoff_from(plane, airport)
    return "It is too windy and stormy out there" if weather.stormy?
    return "The plane has already left the airport" if plane.flying?
    return "The airport is empty" if airport.empty?
    return "The plane is not in this airport" if airport != plane.current_airport

    plane.fly
    airport.remove_plane
  end

  def assign_plane_to_airport(plane, airport)
    plane.assigned_airport(airport)
  end

  private

  def weather
    Weather.new
  end
end
