class WeatherReport

  attr_accessor :tower_call
  
  WEATHER = ["clear", "sunny", "partly cloudy", "light rain", "light fog", 
            "overcast", "showers", "stormy", "stormy", "stormy"]

  def initialize
    pick = rand(10)
    @tower_call = WEATHER[pick]
  end

  def forecast
    @tower_call
  end

end
