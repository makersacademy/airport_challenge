class Weather

  def stormy?
    rand_weather == :stormy
  end

  private

  OUTLOOK = [:stormy, :sunny, :sunny, :stormy, :sunny]

  def rand_weather
    OUTLOOK.sample
  end

end
