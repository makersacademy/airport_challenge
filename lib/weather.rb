class Weather
  attr_reader :weather
  RAND_WEATHER = rand(2)

  def initialize(weather = RAND_WEATHER)
    if weather.zero?
      @weather = "Sunny"
    else
      @weather = "Stormy"
    end
  end

end
