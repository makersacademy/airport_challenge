class Weather
  def stormy?
    random_outlook == :stormy
  end
  private
  OUTLOOKS = [:stormy, :clear, :clear, :clear]

  def random_outlook
    OUTLOOKS.sample
  end
end