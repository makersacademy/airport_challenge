class Weather
  attr_reader :forecast

  def initialize
    weather_options = ["sunny", "stormy"]
    @forecast = weather_options.sample
  end

  def stormy?
    @forecast == "stormy"
  end
  
end
