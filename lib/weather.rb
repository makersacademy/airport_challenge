class Weather

  #POSSIBLE_WEATHER = [:stormy, :sunny, :sunny, :sunny]

  def initialize
    possible_weather = [:stormy, :sunny, :sunny, :sunny]
    @weather = possible_weather.sample
  end

  def stormy?
    @weather == :stormy ? true : false
  end

end
