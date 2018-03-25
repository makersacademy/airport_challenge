class Weather
  attr_accessor :weather_conditions

  def initialize
    @sunny = true
  end

  # def stormy?
  #   @sunny = false
  # end
  #
  # def stormy
  #   @su = false
  # end

  def what_weather
    weather_types = [:sunny, :sunny, :sunny, :stormy]
    @weather_conditions = weather_types.sample
  end

  def stormy?
    @sunny == false
  end
end
