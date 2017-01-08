class Weather

  attr_accessor :weather
  attr_reader :randomizer
  attr_accessor :weather_generator

  DEFAULT_WEATHER = "Sunny"
  def initialize
    @weather = DEFAULT_WEATHER
    weather_generator
  end

  def randomizer
    @random_button = Kernel.rand(100)
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
