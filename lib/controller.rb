class TrafficController

  def instruct_to_land(plane, airport, weather_report)
    return "Plane unable to land as the airport is full" if airport.full?
    return "Plane unable to land as the weather is stormy" if airport.weather(weather_report) == "stormy"

    plane.land(airport)
  end

end
