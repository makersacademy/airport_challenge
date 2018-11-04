class Weather

  def weather_condition
    random_outlook == :stormy
  end

  private

  OUTLOOKS = [:stormy, :fine, :fine, :fine]

  def random_outlook
    OUTLOOKS.sample
  end

end
