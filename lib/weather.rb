class Weather
  attr_reader :weather

  def initialize
    @weather = generate_weather
  end

  def generate_weather
    (0..3) === random ? :sunny : :stormy
  end

  private

  def random
    rand(0..4)
  end
end
