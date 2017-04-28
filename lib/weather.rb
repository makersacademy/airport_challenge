class Weather

  attr_reader :weather
  # RAND_WEATHER = rand(2)

  def initialize(weather = rand(2))
    if weather.zero?
      @weather = "Sunny"
    else
      @weather = "Stormy"
    end
  end

end
