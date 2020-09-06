class Weather
  attr_accessor :weather
  
  def initialize
    @weather = ["sunny", "raining", "sunny", "sunny", "stormy", "sunny", "overcast", "sunny"]
  end

  def weather_now?
    @weather.sample
  end

end