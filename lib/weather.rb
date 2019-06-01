class Weather
  attr_reader :forecast, :weather_options, :random_index

  def initialize
    @weather_options = ["sunny", "stormy"]
    @random_index = rand(@weather_options.length)
  end

  def forecast
    @weather_options[random_index]
  end

  def stormy?
    forecast == "stormy"
  end

end
