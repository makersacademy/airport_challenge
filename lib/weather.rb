module Weather
  def stormy?
    randomised_outlook == :stormy
  end

  private

  POSSIBLE_OUTLOOKS = [:stormy, :sunny, :sunny, :sunny, :overcast]

  def randomised_outlook
    POSSIBLE_OUTLOOKS.sample
  end
end
