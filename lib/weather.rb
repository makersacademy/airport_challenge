class Weather

  attr_reader :current_weather

  def initialize
    @current_weather = 'not stormy'
  end

  def weather_randomizer
    condition = rand(1..10)
    if condition == 1
      @current_weather = 'stormy'
    else
      @current_weather = 'not stormy'
    end
  end

end
