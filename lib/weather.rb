class Weather
  attr_accessor :forecast

  def initialize
    @weather = ["Stormy", "Sunny"]
  end

  def forecast
    @weather.sample
  end

end
