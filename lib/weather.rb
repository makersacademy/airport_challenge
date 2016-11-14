class Weather

  attr_reader :condition

  def initialize
    @condition = random_weather
  end

private
  @@weathers = [:sunny, :stormy]

  def random_weather
    @@weathers.sample
  end
end
