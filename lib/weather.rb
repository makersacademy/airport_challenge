class Weather
  attr_reader :forecast

  def initialize
    @forecast = set_weather
  end

  private
  def set_weather
    rand > 0.2 ? "good" : "stormy" 
  end
end
