class Weather
  def initialize
    @possible_weather = ["Sunny", "Stormy"]
  end

  def current
    @possible_weather.sample
  end
end
