class Weather
  def stormy?
    prognosis == :stormy
  end
  private
  WEATHERS = [:stormy, :fine, :fine, :fine]

  def prognosis
    WEATHERS.sample
  end
end
