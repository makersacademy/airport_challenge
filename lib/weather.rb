class Weather
  def stormy?
    randomised_outlook == :stormy
  end

  POSSIBLE_OUTLOOKS = [:stormy, :sunny, :sunny, :sunny, :overcast]

  def randomised_outlooks
    POSSIBLE_OUTLOOKS.sample
  end
end
