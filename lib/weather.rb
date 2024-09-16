class Weather

  attr_reader :weather

  def initialize
    @weather = random_weather
  end
  
  def stormy?
    @weather == :stormy
  end

  private

  WEATHER = [:stormy, :sunny, :sunny, :sunny, :sunny, :sunny].freeze

  def random_weather
    WEATHER.sample
  end

end
