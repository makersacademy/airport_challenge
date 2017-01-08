module Weather
  def stormy?
    random_outlook == :stormy
  end

  private

  OUTLOOKS = [:stormy, :sunny, :overcast, :showers, :fine, :fog, :fine]

  def random_outlook
    OUTLOOKS.sample
  end
end
