class Weather

  def stormy?
    random_weather == :stormy
  end

  private

  def random_weather
    [:sunny, :sunny, :sunny, :stormy].sample
  end

end
