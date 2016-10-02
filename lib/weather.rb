class Weather
  def stormy?
    random_outlook == :stormy
  end

  OUTLOOKS = [:stormy, :sunny, :sunny, :sunny]

  def random_outlook
    OUTLOOKS.sample
  end
end
