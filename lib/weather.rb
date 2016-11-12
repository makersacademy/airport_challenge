class Weather

  attr_reader :current_weather

  def initialize
    @current_weather = "not stormy"
  end

  def stormy?
    if @current_weather == "stormy"
      true
    else
      false
    end
  end

  def weather_randomizer
    condition = rand(1..10)
    if condition == 1
      @current_weather = "stormy"
    end
  end


end
