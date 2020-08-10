class Weather

  def stormy?
    forecast == :stormy
  end

  private

  OUTLOOKS = [:stormy,:fine,:clear,:sunny,:cloudy]

  def forecast
    @weather = OUTLOOKS.sample
  end

end
