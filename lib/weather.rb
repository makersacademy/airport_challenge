class Weather
  attr_reader :weather

  def initialize
    @weather = random_weather
  end

  def random_weather
    return "stormy" if rand(1..100) >= 95
  end

  def check_for_storm
    true if random_weather == "stormy"
  end

end
