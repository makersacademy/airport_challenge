class Weather

  attr_reader :current_weather

  WEATHER_CONDITIONS = [:sunny, :sunny, :sunny, :sunny, :sunny,
                        :sunny, :sunny, :sunny, :sunny, :stormy]

  def initialize
    @current_weather = WEATHER_CONDITIONS.sample
  end

  def return_weather
    @current_weather
  end

end
