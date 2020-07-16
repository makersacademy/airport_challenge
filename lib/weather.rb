module Weather
  def stormy?
    random_states == :stormy
  end
    private
  WEATHER_STATES = [:stormy, :sunny, :sunny, :sunny]
  def random_states
    WEATHER_STATES.sample
  end

end
