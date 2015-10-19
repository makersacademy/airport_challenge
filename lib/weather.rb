class Weather
  def initialize
    @possible_conditions = [:stormy, :sunny]
  end

  def weather_conditions
    @possible_conditions.sample
  end
end
