class Weather
  attr_reader :weather

  def initialize
    @weather = generate_weather
  end

  def generate_weather
    rng = rand(1..5)
    return rng == 5 ? "stormy" : "sunny"
  end
end
