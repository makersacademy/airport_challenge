module Weather
  def weather
    [:sunny, :sunny, :sunny, :stormy].sample
  end

  def stormy?
      weather == :stormy
  end

end