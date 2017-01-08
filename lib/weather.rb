class Weather

  attr_accessor :weather
  attr_reader :randomizer

  DEFAULT_WEATHER = "Sunny"
  def initialize
    @weather = DEFAULT_WEATHER
    weather_generator
  end

  def randomizer
    @random_button = rand(100)
  end

  def weather_generator
    randomizer
    if @random_button <= 75
      @weather = "Sunny"
    else
      @weather = "Stormy"
    end
  end
end
