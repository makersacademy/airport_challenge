class Weather
  OUTCOMES = [:sunny, :sunny, :sunny, :stormy]

  def stormy?
    OUTCOMES.sample == :stormy
  end

end
