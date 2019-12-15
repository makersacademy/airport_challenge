class Weather_Service

  def current_weather(airport)
    #airport not actually used
    current_weather = rand(5) == 0 ? "stormy" : "sunny"
  end
end
