module Weather
  def Weather.generate_weather
    # If the random number > 7, then weather is stormy, otherwise it is sunny
    rand(10) > 7 ? "stormy" : "sunny"
  end
end
