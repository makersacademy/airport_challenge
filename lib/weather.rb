require_relative 'airport'

class Weather
  def weather_report
    [1, 2, 3, 4, 5, 6].sample <= 5 ? @weather = "sunny" : @weather = "stormy"
  end
end
