module Weather
  def stormy?
    forecast == :stormy
  end

  private
  OUTCOMES = [:stormy, :sunny, :showers, :overcast, :clear, :mist, :wind].freeze

  def forecast
    OUTCOMES.sample
  end
end
