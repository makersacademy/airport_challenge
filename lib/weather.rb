class Weather

  def weather_forecast
    @stormy = rand < 0.1 ? true : false
  end

  def stormy?
    @stormy
  end

  private

  attr_accessor :stormy


end
