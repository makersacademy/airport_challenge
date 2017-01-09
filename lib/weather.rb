class Weather

  def stormy?
    set_weather(randomise)
    @stormy
  end

  def set_weather(random_number)
    @stormy = random_number >= 40 ? true : false
  end

  def randomise
    rand(50)
  end
end
