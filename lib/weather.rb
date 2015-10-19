module Weather

  def conditions
    random_weather
  end

private

  def random_weather
    type_of_weather = [:fine, :fine, :fine, :fine, :fine, :stormy]
    type_of_weather.sample
  end

end
