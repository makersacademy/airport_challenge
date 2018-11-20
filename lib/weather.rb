class Weather
  attr_accessor :current_weather

  def initialize
    if rand(1..10) == 1
      @current_weather = 'storm'
    else
      @current_weather = 'good'
    end
  end

  def set_weather_stormy
    @current_weather = "storm"
  end

  def set_weather_good
    @current_weather = "good"
  end
end
