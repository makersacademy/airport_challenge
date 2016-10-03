class Weather

  def stormy?
    random_weather == 1
  end

  private
  def random_weather
    # rand(4)
    4
  end

end
