class Weather

attr_reader :weather

def initialize
  @weather = random_weather
end

def stormy?
  @weather == :stormy
end

private
WEATHER = [:sunny, :sunny, :sunny, :sunny, :stormy]

  def random_weather
    WEATHER.sample
  end
end
