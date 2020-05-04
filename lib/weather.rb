require_relative 'airport'
require_relative 'plane'

class Weather

  def weather_condition
    ["Sunny", "Cloudy", "Rainy", "Windy", "Snowy", "Stormy"].sample
  end
end
