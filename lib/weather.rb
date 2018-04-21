class Weather

def stormy?
  random_weather == :stormy
end

private
WEATHER = [:sunny, :sunny, :sunny, :sunny, :stormy]

  def random_weather
    WEATHER.sample
  end
end
