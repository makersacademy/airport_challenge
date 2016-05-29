class Weather

  def weather_forecast
    weather = rand
    weather < 0.1 ? @stormy = true : @stormy = false
  end

  def stormy?
    @stormy
  end

  private

  attr_accessor :weather_report, :stormy


end
