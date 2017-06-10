
class Weather

  WEATHER = [:sunny, :fair, :cloudy, :stormy]

  attr_reader :conditions

  def initialize
    @conditions = create_weather
  end

  def stormy?
     conditions == :stormy
  end

  private

  def create_weather
    WEATHER.sample
  end

end
