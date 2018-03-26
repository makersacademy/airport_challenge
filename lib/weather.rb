class Weather

  attr_accessor :weather_condition

  def stormy?
    @weather_condition = random_weather_condition
    @weather_condition == :stormy
  end

  private

  def random_weather_condition
    [:sunny, :sunny, :stormy, :sunny, :sunny, :sunny].sample
  end

end
