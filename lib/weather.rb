class Weather

attr_reader :current_weather

def current_weather
  @current_weather = random_weather
end

private
WEATHER = [:sunny, :sunny, :sunny, :sunny, :stormy]

  def random_weather
    WEATHER.sample
  end
end
