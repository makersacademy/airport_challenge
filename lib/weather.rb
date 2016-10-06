class Weather

  OUTLOOKS = [:stormy, :sunny, :sunny, :sunny]

  def random_outlook
    OUTLOOKS.sample
  end

  private

  def stormy?
    random_outlook == :stormy
  end
end
