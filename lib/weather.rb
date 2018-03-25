class Weather
  attr_accessor :weather

  def initialize
    @weather = ["sunny", "sunny", "sunny", "sunny", "sunny", "stormy"]
  end

  def current_weather
    @weather[rand(0..5)]
  end
end
