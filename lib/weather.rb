class Weather

  def initialize
    possible_weather = [:stormy, :sunny, :sunny, :sunny]
    @weather = possible_weather.sample
  end

  def stormy?
    @weather == :stormy
  end

end
