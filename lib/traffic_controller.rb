require 'weather'
require 'airport'

class TrafficController
  def land_to(plane, airport)
    if weather.stormy?
      'It is too windy and stormy out there'
    else
      airport.add_plane(plane)
    end
  end

  def takeoff_from(airport)
    if weather.stormy?
      'It is too windy and stormy out there'
    elsif airport.empty?
      "The airport is empty"
    else
      airport.remove_plane
    end
  end

  def weather
    Weather.new
  end
end
