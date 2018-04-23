class Weather
  def stormy?
    [:stormy, :sunny, :sunny, :sunny].sample == :stormy
  end
end
