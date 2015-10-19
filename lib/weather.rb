class Weather
  def initialize
    @possible_conditions = [:stormy, :sunny]
  end

  def stormy?
    weather_conditions == :stormy
  end
  private

  def weather_conditions
    @possible_conditions.sample
  end
end
