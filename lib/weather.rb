class Weather
  attr_reader :weather_now

  def chance
    rand(0..2)
  end

  def check_weather
    if chance.zero?
      weather = "stormy"
    else
      weather = "sunny"
    end
    weather
  end
end

# def initialize
#   @weather_now=self.check_weather
# end
