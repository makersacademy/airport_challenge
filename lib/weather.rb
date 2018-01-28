class Weather
  def stormy?
    random_outlook == :stormy
  end

  private

  OUTLOOKS = [:sunny, :sunny, :stormy, :sunny, :sunny]

  def random_outlook
    OUTLOOKS.sample
  end
end
