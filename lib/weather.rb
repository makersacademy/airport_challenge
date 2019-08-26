class Weather
  attr_reader :sunny, :stormy

  def get_weather
    rand(100) < 90 ? :sunny : :stormy
  end
end
