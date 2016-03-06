module Weather
  def stormy?
    forecast == :stormy
  end

  private
  OUTCOMES = [:stormy, :sunny, :showers, :overcast, :clear, :mist, :wind]

  def forecast
    OUTCOMES.sample
  end
end
