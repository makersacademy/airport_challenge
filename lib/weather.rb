class Weather

  def stormy?
    stormy_weather == :stormy
  end

  private

  CONDITIONS = [:stormy, :sunny, :sunny, :sunny, :sunny, :sunny, :sunny, :sunny]

  def stormy_weather
    CONDITIONS.sample
  end


end
