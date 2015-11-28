class Weather

  attr_reader :current_weather

  def set_the_weather
    weather_options = [:stormy, :clear, :foggy, :misty, :rainy]
    @current_weather = weather_options[rand(5)]
  end

end
