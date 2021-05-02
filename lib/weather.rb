class Weather

  WEATHER_POSSIBLES = ["sunny", "sunny", "stormy"]  
  # more sunnys  than stormys so that only occasionally the status is stormy

  def status
    WEATHER_POSSIBLES.sample
  end
end
