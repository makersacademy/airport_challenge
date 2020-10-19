class Weather
  attr_reader :weather

  def initialize(storm_chance)
    @weather = generate_weather(storm_chance)
  end

  def generate_weather(storm_chance)
    chance = storm_chance * 100
    rng = rand(1..chance)
    return rng == chance ? :stormy : :sunny
  end
end
