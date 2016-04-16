class Weather

  def stormy?
    random_weather
    @stormy
  end

  def random_weather
    number = rand(20)
    if number <= 1
      @stormy = true
    else
      @stormy = false
    end
  end

end
