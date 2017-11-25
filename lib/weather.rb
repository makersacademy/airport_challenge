class Weather

  def current_weather
    stormy? ? :stormy : :clear
  end

  protected

  def stormy?
    rand(1..4) == 4 ? true : false
  end

end
