class Weather

  def stormy?
    weather_is_stormy?
  end

  private

  def weather_is_stormy?
    rand()*10 > 9 ? true : false
  end

end
