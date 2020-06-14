class Weather
  attr_reader :weather
  @weather = state

  def check
    rand(10) == 9 ? :stormy : :sunny
  end

end
