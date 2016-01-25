module Weather
  def weather
    @weather = [:sunny, :raining, :snow, :ail, :stormy]
    @weather.sample
  end
end