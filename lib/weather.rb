class Weather
  attr_reader :stormy, :weather_randomiser

  def initialize
    weather_randomiser
  end

  def is_stormy?
    stormy
  end

  def weather_randomiser
    if rand(20) <= 1
      @stormy = true
    else
      @stormy = false
    end
  end
end
