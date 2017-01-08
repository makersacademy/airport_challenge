class Weather
  attr_reader :current_weather

  WEATHER_CONDITIONS = %w(Sunny Stormy).freeze

  def initialize
    weather_generator
  end

  def weather_generator
    @current_weather = Random.new.rand(5) <= 3 ? WEATHER_CONDITIONS[0] : WEATHER_CONDITIONS[1]
  end
end
