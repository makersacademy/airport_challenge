class Weather

  def stormy?
    random_weather
  end

  def random_weather
    number = rand(20)
    if number <= 1
      true
    else
      false
    end
  end

end
