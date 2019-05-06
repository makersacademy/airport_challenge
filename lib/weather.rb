class Weather
  attr_accessor :condition

  def initialize
    @condition = :stormy
  end


  WEATHER = [:sunny, :sunny, :stormy, :sunny, :sunny]

  def stormy?
    condition == WEATHER.sample
  end
end
