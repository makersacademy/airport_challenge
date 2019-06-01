class Weather
  attr_reader :forecast, :weather_options, :index

  def initialize
    @weather_options = ["sunny", "stormy"]
    @index = rand(@weather_options.length)
    @forecast = weather_options[@index]
  end

  def stormy?
    @forecast == "stormy"
  end

end
