class Weather
  def forcast
    return "stormy" if rand(10) == 1

    return "sunny"
  end
end
