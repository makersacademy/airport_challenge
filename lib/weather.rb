

class Weather

  attr_reader :forecast

  def initialize
    @forecast = forecast?
  end

  def forecast?
    @forecast = 'Stormy'
  end

  def stormy?
    @forecast == 'Stormy'
  end

  # def check_weather
  #   @forecast = 'Stormy'
end


module MyWeather
  def check_weather
    'Stormy'
  end
end
