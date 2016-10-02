class Weather

  def stormy?
    stormy_weather == :stormy ? true : false
  end

  private

  CONDITIONS = [:stormy, :sunny, :sunny, :sunny, :sunny]

  def stormy_weather
    CONDITIONS.sample
  end


end
