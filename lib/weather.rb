class Weather

  def stormy?
    random_weather == :stormy
  end

  private

  OUTLOOKS = [:stormy, :sunny, :sunny, :sunny]

  def random_weather
    OUTLOOKS.sample
  end

end
