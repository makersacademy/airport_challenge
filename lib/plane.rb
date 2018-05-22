# Understands whether the weather is stormy
class WeatherMachine

  WEATHERS = ["sunny", "sunny", "sunny", "sunny", "sunny", "sunny", "stormy"]

  def initialize(weathers = WEATHERS)
    @weathers = weathers.sample
  end

  def stormy?
    @weathers == "stormy"
  end

end
