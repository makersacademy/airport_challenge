class Air_Traffic_Controller

  def instruct_plane_to_land(airport, plane, weather_service)
    if airport.weather(weather_service) == "stormy"
      return "Planes unable to land as airport weather is stormy"
    end
    plane.land(airport)
  end

  def instruct_plane_to_take_off(airport, plane, weather_service)
    if airport.weather(weather_service) == "stormy"
      return "Planes unable to take off as airport weather is stormy"
    end
    plane.take_off(airport)
  end
end
