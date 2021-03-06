class Weather
  WIND = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
  CHANCE_OF_RAIN = [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
  TEMPERATURE = [-20, -10, 0, 10, 20, 30, 40, 50]

  attr_reader :wind, :chance_of_rain, :temperature

  def initialize(
    wind = WIND.sample,
    chance_of_rain = CHANCE_OF_RAIN.sample,
    temperature = TEMPERATURE.sample
  )
    @wind = wind
    @chance_of_rain = chance_of_rain
    @temperature = temperature
  end

  def strength_of_wind
    @wind
  end

  def chances_of_rain
    @chance_of_rain
  end

  def temperatures
    @temperature
  end

  def forecast
    {
      :strength_of_wind => strength_of_wind,
      :chances_of_rain => chance_of_rain,
      :temperatures => temperature
    }
  end

end
