class Weather
  def stormy?
    random_weather == :stormy
  end

  private

  def random_weather
    rand(7).zero? ? :stormy : :sunny
  end
end
